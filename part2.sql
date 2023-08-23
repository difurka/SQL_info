--Task 1

CREATE FUNCTION fn_last_check_for_this_peer_and_task(p_nickname_is_checked VARCHAR,
                                                     p_task_name VARCHAR)
    RETURNS SETOF P2P
AS
$BODY$
BEGIN
    RETURN QUERY (SELECT P2P.*
                  FROM checks
                           join P2P on checks.id = P2P."Check"
                  WHERE checks.Peer = p_nickname_is_checked
                    AND checks.Task = p_task_name
                  ORDER BY "Date" DESC, "Time" DESC
                  LIMIT 1);
END;
$BODY$
    LANGUAGE plpgsql;


CREATE FUNCTION fn_last_check_of_this_task_finished(p_nickname_is_checked VARCHAR,
                                                    p_task_name VARCHAR)
    RETURNS BOOLEAN AS
$BODY$
BEGIN
    IF (
            (
                        (SELECT state
                         FROM fn_last_check_for_this_peer_and_task(p_nickname_is_checked,
                                                                   p_task_name)) IN ('Success', 'Failure')
                    OR
                        (SELECT state
                         FROM fn_last_check_for_this_peer_and_task(p_nickname_is_checked,
                                                                   p_task_name)) IS NULL
                )
            AND
            (
                    (SELECT state
                     FROM verter
                     WHERE "Check" = (SELECT "Check"
                                      FROM fn_last_check_for_this_peer_and_task(p_nickname_is_checked,
                                                                                p_task_name))
                     LIMIT 1) IS NULL
                    OR
                    (SELECT state
                     FROM verter
                     WHERE "Check" = (SELECT "Check"
                                      FROM fn_last_check_for_this_peer_and_task(p_nickname_is_checked,
                                                                                p_task_name))
                     ORDER BY verter.id DESC
                     LIMIT 1) IN ('Success', 'Failure')
                )
        ) THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$BODY$
    LANGUAGE plpgsql;


CREATE FUNCTION fn_last_check_started(p_nickname_is_checked VARCHAR, p_nickname_checker VARCHAR,
                                      p_task_name VARCHAR)
    RETURNS BOOLEAN AS
$BODY$
BEGIN
    IF (
        (
                    (SELECT state
                     FROM fn_last_check_for_this_peer_and_task(p_nickname_is_checked,
                                                               p_task_name)) = 'Start'
                AND
                    (SELECT checkingpeer
                     FROM fn_last_check_for_this_peer_and_task(p_nickname_is_checked,
                                                               p_task_name)) = p_nickname_checker
            )
        ) THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$BODY$
    LANGUAGE plpgsql;


CREATE PROCEDURE add_p2p_check(p_nickname_is_checked VARCHAR,
                               p_nickname_checker VARCHAR,
                               p_task_name VARCHAR,
                               p_check_status Status,
                               p_time TIME) AS
$BODY$
BEGIN
    IF (p_nickname_is_checked != p_nickname_checker) THEN
        IF
            (p_check_status = 'Start' AND fn_last_check_of_this_task_finished(p_nickname_is_checked,
                                                                              p_task_name)
                ) THEN
            BEGIN
                INSERT INTO checks (peer, task, "Date")
                VALUES (p_nickname_is_checked, p_task_name, now());
                INSERT INTO P2P ("Check", checkingpeer, state, "Time")
                VALUES ((SELECT max(checks.id) FROM checks),
                        p_nickname_checker,
                        'Start',
                        p_time);
            END;
        ELSIF
            (p_check_status IN ('Success', 'Failure') AND fn_last_check_started(p_nickname_is_checked,
                                                                                p_nickname_checker,
                                                                                p_task_name)
                ) THEN
            BEGIN
                INSERT INTO P2P ("Check", checkingpeer, state, "Time")
                VALUES ((SELECT "Check"
                         FROM fn_last_check_for_this_peer_and_task(p_nickname_is_checked,
                                                                   p_task_name)),
                        p_nickname_checker,
                        p_check_status,
                        p_time);
            END;
        END IF;
    END IF;
END;
$BODY$
    LANGUAGE plpgsql;

--Task 2
CREATE FUNCTION fn_last_successful_check(p_nickname_is_checked VARCHAR,
                                         p_task_name VARCHAR)
    RETURNS setof bigint AS
$BODY$
BEGIN
    RETURN QUERY (SELECT "Check"
                  FROM P2P
                           JOIN checks ON "Check" = checks.id
                  WHERE Peer = p_nickname_is_checked
                    AND Task = p_task_name
                    AND state = 'Success'
                  ORDER BY "Date" DESC, "Time" DESC
                  LIMIT 1);
END;
$BODY$
    LANGUAGE plpgsql;

CREATE FUNCTION fn_this_check_ready_for_verter(p_nickname_is_checked VARCHAR,
                                               p_task_name VARCHAR, p_check_status Status)
    RETURNS BOOLEAN AS
$BODY$
DECLARE
    check_id BIGINT := fn_last_successful_check(p_nickname_is_checked, p_task_name);
BEGIN
    IF
        (
                ((SELECT id FROM verter WHERE check_id = "Check") IS NULL AND p_check_status = 'Start')
                OR
                ((SELECT count(*) FROM verter WHERE check_id = "Check" GROUP BY "Check") = 1 AND
                 p_check_status IN ('Success', 'Failure'))
            ) THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$BODY$
    LANGUAGE plpgsql;

CREATE PROCEDURE add_verter_check(p_nickname_is_checked VARCHAR,
                                  p_task_name VARCHAR,
                                  p_check_status Status,
                                  p_time TIME) AS
$BODY$
DECLARE
    check_id BIGINT := fn_last_successful_check(p_nickname_is_checked, p_task_name);
BEGIN
    IF
            check_id IS NOT NULL AND fn_this_check_ready_for_verter(p_nickname_is_checked,
                                                                    p_task_name,
                                                                    p_check_status)
    THEN
        INSERT INTO verter ("Check", state, "Time")
        VALUES (check_id,
                p_check_status,
                p_time);
    END IF;
END;
$BODY$
    LANGUAGE plpgsql;

--Task 3
CREATE FUNCTION fn_trg_after_P2P_insert() RETURNS TRIGGER AS
$trg_after_P2P_insert$
BEGIN
    IF
        NEW.state = 'Start' THEN
        IF (SELECT count(id)
            FROM transferredpoints
            WHERE checkingpeer = NEW.checkingpeer
              AND checkedpeer = (SELECT Peer FROM Checks WHERE NEW."Check" = Id)) = 0 THEN
            BEGIN
                INSERT INTO transferredpoints (checkingpeer, checkedpeer, pointsamount)
                VALUES (NEW.checkingpeer, (SELECT Peer FROM Checks WHERE NEW."Check" = Id), 1);
            END;
        ELSE
            BEGIN
                UPDATE transferredpoints
                SET pointsamount = pointsamount + 1
                WHERE checkingpeer = NEW.checkingpeer
                  AND checkedpeer = (SELECT Peer FROM Checks WHERE NEW."Check" = Id);
            END;
        END IF;
    END IF;
    RETURN NULL;
END
$trg_after_P2P_insert$
    LANGUAGE plpgsql;


CREATE TRIGGER trg_after_P2P_insert
    AFTER INSERT
    ON P2P
    FOR EACH ROW
EXECUTE PROCEDURE fn_trg_after_P2P_insert();

--Task 4
CREATE FUNCTION fn_trg_before_XP_insert()
    RETURNS TRIGGER
AS
$trg_before_XP_insert$
BEGIN
    IF
        (fn_check_status_p2p(NEW."Check") IS NULL)
    THEN
        RAISE EXCEPTION 'This check is not exist';
    ELSIF
        (fn_check_status_p2p(NEW."Check") IS FALSE) THEN
        RAISE EXCEPTION 'This check is not successful';
    ELSIF
        (fn_check_amount(NEW.xpamount, NEW."Check") IS FALSE) THEN
        RAISE EXCEPTION 'Amount of XP is bigger then maxXP';
    END IF;
    RETURN NEW;
END;
$trg_before_XP_insert$
    LANGUAGE plpgsql;



CREATE TRIGGER trg_before_XP_insert
    BEFORE INSERT
    ON XP
    FOR EACH ROW
EXECUTE PROCEDURE fn_trg_before_XP_insert();
