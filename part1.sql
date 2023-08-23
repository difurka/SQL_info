CREATE TABLE Peers
(
    Nickname VARCHAR NOT NULL PRIMARY KEY,
    Birthday DATE    NOT NULL
);

CREATE TYPE Status AS ENUM ('Start', 'Success', 'Failure');

CREATE FUNCTION fn_is_parenttask_have_null(parent VARCHAR) RETURNS BOOL AS
$$
BEGIN
    IF parent IS NULL AND ((SELECT COUNT(title) FROM tasks WHERE ParentTask IS NULL) > 0)
    THEN
        RETURN false;
    ELSE
        RETURN true;
    END IF;
END;
$$
    LANGUAGE plpgsql;

CREATE TABLE Tasks
(
    Title      VARCHAR NOT NULL PRIMARY KEY,
    ParentTask VARCHAR,
    MaxXP      BIGINT  NOT NULL,
    CONSTRAINT fk_Tasks_ParentTask FOREIGN KEY (ParentTask) REFERENCES Tasks (Title),
    CONSTRAINT ch_Tasks_MaxXP CHECK (MaxXP > 0),
    CONSTRAINT ch_Tasks_ParentTask_null CHECK (fn_is_parenttask_have_null(ParentTask))
);

CREATE TABLE Checks
(
    ID     SERIAL  NOT NULL PRIMARY KEY,
    Peer   VARCHAR NOT NULL,
    Task   VARCHAR NOT NULL,
    "Date" DATE    NOT NULL,
    CONSTRAINT fk_Checks_Peer FOREIGN KEY (Peer) REFERENCES Peers (Nickname),
    CONSTRAINT fk_Checks_Task FOREIGN KEY (Task) REFERENCES Tasks (Title)
);

CREATE TABLE P2P
(
    ID           SERIAL  NOT NULL PRIMARY KEY,
    "Check"      BIGINT  NOT NULL,
    CheckingPeer VARCHAR NOT NULL,
    State        Status  NOT NULL,
    "Time"       TIME    NOT NULL DEFAULT CURRENT_TIME,
    CONSTRAINT fk_p2p_Check FOREIGN KEY ("Check") REFERENCES Checks (ID),
    CONSTRAINT fk_P2P_checkingPeer FOREIGN KEY (CheckingPeer) REFERENCES Peers (Nickname)
);

CREATE TABLE TransferredPoints
(
    ID           SERIAL  NOT NULL PRIMARY KEY,
    CheckingPeer VARCHAR NOT NULL,
    CheckedPeer  VARCHAR NOT NULL,
    PointsAmount BIGINT  NOT NULL,
    CONSTRAINT fk_TransferredPoints_checkingPeer FOREIGN KEY (CheckingPeer) REFERENCES Peers (Nickname),
    CONSTRAINT fk_TransferredPoints_checkedPeer FOREIGN KEY (CheckedPeer) REFERENCES Peers (Nickname),
    CONSTRAINT un_TransferredPoints_CheckingPeer_CheckedPeer UNIQUE (CheckingPeer, CheckedPeer),
    CONSTRAINT ch_TransferredPoints_checkingPeer CHECK (CheckingPeer <> CheckedPeer),
    CONSTRAINT ch_TransferredPoints_PointsAmount CHECK (PointsAmount > 0)
);

CREATE TABLE Friends
(
    ID    SERIAL  NOT NULL PRIMARY KEY,
    Peer1 VARCHAR NOT NULL,
    Peer2 VARCHAR NOT NULL,
    CONSTRAINT fk_Friends_Peer1 FOREIGN KEY (Peer1) REFERENCES Peers (Nickname),
    CONSTRAINT fk_Friends_Peer2 FOREIGN KEY (Peer2) REFERENCES Peers (Nickname),
    CONSTRAINT un_Friends_Peer1_Peer2 UNIQUE (Peer1, Peer2)
);

CREATE TABLE Recommendations
(
    ID              SERIAL  NOT NULL PRIMARY KEY,
    Peer            VARCHAR NOT NULL,
    RecommendedPeer VARCHAR NOT NULL,
    CONSTRAINT fk_Recommendations_Peer FOREIGN KEY (Peer) REFERENCES Peers (Nickname),
    CONSTRAINT fk_Recommendations_RecommendedPeer FOREIGN KEY (RecommendedPeer) REFERENCES Peers (Nickname),
    CONSTRAINT un_Recommendations_Peer_RecommendedPeer UNIQUE (Peer, RecommendedPeer)
);

CREATE FUNCTION fn_check_time("Day" DATE, "Time" TIME, "Peer" Varchar, State INT) RETURNS BOOL AS
$$
DECLARE
    r RECORD;
BEGIN
    SELECT * FROM timetracking t WHERE t.Peer = "Peer" AND t."Date" = "Day" ORDER BY 1 DESC LIMIT 1 INTO r;

    IF (r IS NOT NULL AND ((r."Time" > "Time") OR (r.State = State))) THEN RETURN FALSE; END IF;
    IF (r IS NULL AND State = 2) THEN RETURN FALSE; END IF;
    RETURN TRUE;
END;
$$
    LANGUAGE plpgsql;

CREATE TABLE TimeTracking
(
    ID     SERIAL  NOT NULL PRIMARY KEY,
    Peer   VARCHAR NOT NULL,
    "Date" DATE    NOT NULL DEFAULT CURRENT_DATE,
    "Time" TIME    NOT NULL DEFAULT CURRENT_TIME,
    State  INT     NOT NULL DEFAULT 1,
    CONSTRAINT fk_TimeTracking_Peer FOREIGN KEY (Peer) REFERENCES Peers (Nickname),
    CONSTRAINT fk_TimeTracking_State CHECK (State IN (1, 2)),
    CONSTRAINT fk_TimeTracking_Time_and_State CHECK (fn_check_time("Date", "Time", Peer, State))
);

CREATE FUNCTION fn_check_amount(XPAmount BIGINT, CheckID BIGINT) RETURNS BOOL AS
$$
DECLARE
    task_name VARCHAR = (SELECT c.Task
                         FROM Checks c
                         WHERE c.ID = CheckID);
BEGIN
    RETURN (XPAmount <= (SELECT MaxXP FROM Tasks p WHERE p.Title = task_name))
        AND (XPAmount > 0);
END;
$$
    LANGUAGE plpgsql;

CREATE FUNCTION fn_check_status_p2p(CheckID BIGINT) RETURNS BOOL AS
$$
BEGIN
    RETURN (SELECT State FROM P2P p WHERE p."Check" = CheckID AND p.state = 'Success') IS NOT NULL;
END;
$$
    LANGUAGE plpgsql;

CREATE TABLE Verter
(
    ID      SERIAL NOT NULL PRIMARY KEY,
    "Check" BIGINT NOT NULL,
    State   Status NOT NULL,
    "Time"  TIME   NOT NULL DEFAULT CURRENT_TIME,
    CONSTRAINT fk_Verter_check FOREIGN KEY ("Check") REFERENCES Checks (ID),
    CONSTRAINT ch_Verter_check CHECK (fn_check_status_p2p("Check"))
);

CREATE TABLE XP
(
    ID       SERIAL NOT NULL PRIMARY KEY,
    "Check"  BIGINT NOT NULL,
    XPAmount BIGINT NOT NULL,
    CONSTRAINT fk_XP_Check FOREIGN KEY ("Check") REFERENCES Checks (ID),
    CONSTRAINT ch_XP_Check CHECK (fn_check_status_p2p("Check")),
    CONSTRAINT ch_XP_XPAmount CHECK (fn_check_amount(XPAmount, "Check"))
);

CREATE PROCEDURE csv_import(table_name TEXT, file_name TEXT, delimiter TEXT) AS
$BODY$
BEGIN
    DROP TABLE IF EXISTS temp;
    EXECUTE FORMAT('CREATE TEMPORARY TABLE IF NOT EXISTS  temp (LIKE %I INCLUDING DEFAULTS);', table_name);
    EXECUTE FORMAT('COPY temp FROM %L (FORMAT CSV, HEADER, DELIMITER %L)', file_name, delimiter);
    EXECUTE FORMAT ('INSERT INTO %I SELECT * FROM temp ON CONFLICT DO NOTHING', table_name);
    EXECUTE FORMAT('CALL update_serial(%L)', table_name);
    DROP TABLE IF EXISTS temp;
END;
$BODY$
    LANGUAGE plpgsql;

CREATE PROCEDURE csv_export(table_name TEXT, file_name TEXT, delimiter TEXT) AS
$BODY$
BEGIN
    EXECUTE FORMAT('COPY %I TO %L (FORMAT CSV, HEADER, DELIMITER %L)'
        , table_name, file_name, delimiter);
END;
$BODY$
    LANGUAGE plpgsql;

CREATE PROCEDURE update_serial(table_names TEXT) AS
$BODY$
BEGIN
    IF EXISTS(SELECT sequence_name FROM information_schema.sequences WHERE sequence_name = table_names || '_id_seq')
    THEN
        EXECUTE FORMAT('SELECT setval(%L,MAX(ID)) FROM %I', table_names || '_id_seq', table_names);
    END IF;
END;
$BODY$
    LANGUAGE plpgsql;
    