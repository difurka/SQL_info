CREATE TABLE "TableNamePeers"
(
    Nickname VARCHAR NOT NULL PRIMARY KEY,
    PRP      BIGINT
);

CREATE TABLE "TableNameTribes"
(
    Name VARCHAR NOT NULL PRIMARY KEY
);

CREATE TABLE "TableNameBalance"
(
    Name VARCHAR NOT NULL PRIMARY KEY
);

CREATE FUNCTION fn_count_of_peers_prp_more_then(num INTEGER)
    RETURNS INTEGER AS
$$
BEGIN
    RETURN (SELECT COUNT(PRP) FROM "TableNamePeers" WHERE PRP > num);
END;
$$
    LANGUAGE plpgsql;

CREATE FUNCTION fn_count_of_peers_prp_less_then(num INTEGER)
    RETURNS INTEGER AS
$$
BEGIN
    RETURN (SELECT COUNT(PRP) FROM "TableNamePeers" WHERE PRP < num);
END;
$$
    LANGUAGE plpgsql;

CREATE FUNCTION fn_count_of_peers_prp_diapason(x INTEGER, y INTEGER)
    RETURNS INTEGER AS
$$
BEGIN
    RETURN (SELECT COUNT(PRP) FROM "TableNamePeers" WHERE PRP > x AND PRP < y);
END;
$$
    LANGUAGE plpgsql;

CREATE FUNCTION fn_total_prp()
    RETURNS INTEGER AS
$$
BEGIN
    RETURN (SELECT COUNT(PRP) FROM "TableNamePeers");
END;
$$
    LANGUAGE plpgsql;

CREATE FUNCTION fn_prp_balance(name VARCHAR)
    RETURNS INTEGER AS
$$
BEGIN
    RETURN (SELECT PRP FROM "TableNamePeers" WHERE Nickname = name);
END;
$$
    LANGUAGE plpgsql;

CREATE FUNCTION tr_trigger()
    RETURNS TRIGGER
AS
$BODY$
    BEGIN
    RAISE EXCEPTION 'Start inserting new peer';
    END;
$BODY$
    LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_before_insert_TableNamePeers
    BEFORE INSERT
    ON "TableNamePeers"
    FOR EACH ROW
EXECUTE PROCEDURE tr_trigger();

--Task 1
CREATE PROCEDURE pr_drop_tablename_tables() AS
$$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT tablename FROM pg_tables WHERE tablename LIKE 'TableName%'
        LOOP
            EXECUTE FORMAT('DROP TABLE IF EXISTS %I CASCADE;', rec.tablename);
        END LOOP;
END;
$$
    LANGUAGE plpgsql;

--Task 2
CREATE PROCEDURE pr_all_functions(OUT total BIGINT, INOUT functions REFCURSOR)
AS
$BODY$

BEGIN
    CREATE TEMP TABLE temp
    (
        "Text" TEXT
    ) ON COMMIT DROP;
    INSERT INTO temp
        (SELECT routine_name || '(' || parameter_name || ' ' || parameters.data_type || ')' AS "Functions"
         FROM information_schema.routines
                  RIGHT JOIN information_schema.parameters ON routines.specific_name = parameters.specific_name
         WHERE routine_type = 'FUNCTION'
           AND routine_schema = 'public');

    OPEN functions FOR SELECT * FROM temp WHERE "Text" IS NOT NULL;
    SELECT (SELECT COUNT(*) FROM temp) INTO total;
END;
$BODY$
    LANGUAGE plpgsql;

--Task 3
CREATE PROCEDURE pr_drop_all_dml_triggers(OUT total BIGINT)
AS
$$
DECLARE
    rec RECORD;
BEGIN
    total = 0;
    FOR rec IN SELECT *
               FROM information_schema.triggers
               WHERE trigger_schema = 'public'
                 AND event_manipulation IN ('INSERT', 'SELECT', 'UPDATE', 'DELETE')
        LOOP
            EXECUTE FORMAT('DROP TRIGGER IF EXISTS %I ON %I CASCADE;', rec.trigger_name, rec.event_object_table);
            total = total + 1;
        END LOOP;
END;
$$
    LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_before_insert_TableNamePeers
    BEFORE INSERT
    ON "TableNamePeers"
    FOR EACH ROW
EXECUTE PROCEDURE tr_trigger();

CREATE OR REPLACE TRIGGER trg_before_select_TableNamePeers
    BEFORE UPDATE
    ON "TableNamePeers"
    FOR EACH ROW
EXECUTE PROCEDURE tr_trigger();

--task 4
CREATE FUNCTION fn_find_text("Text" TEXT, "template" TEXT)
    RETURNS BOOL AS
$$
DECLARE
    arr text[];
    str text;
BEGIN
    arr = regexp_split_to_array("Text", E'\n');
    FOREACH str IN ARRAY arr
        LOOP
            RAISE NOTICE '%', str;
            IF (str LIKE "template") THEN RETURN TRUE; END IF;
        END LOOP;
    RETURN FALSE;
END;
$$
    LANGUAGE plpgsql;

CREATE PROCEDURE pr_find_text_in_body(IN "Text" TEXT, INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        WITH filtred_objects AS
                 (SELECT routine_name AS name, routine_type AS type
                  FROM information_schema.routines r
                  WHERE routine_type IN ('FUNCTION', 'PROCEDURE')
                    AND routine_schema = 'public'
                    AND r.data_type != 'trigger' OR r.data_type IS NULL)

        SELECT filtred_objects.*
        FROM filtred_objects
                 LEFT JOIN pg_proc ON proname = name
        WHERE fn_find_text(prosrc, '%' || "Text" || '%');
END ;
$BODY$
    LANGUAGE plpgsql;