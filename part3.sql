--Task 1
CREATE FUNCTION fn_prp_balance()
    RETURNS TABLE
            (
                Peer1        VARCHAR,
                Peer2        VARCHAR,
                PointsAmount BIGINT
            )
AS
$BODY$
BEGIN
    RETURN QUERY (WITH temp AS
                           (SELECT t1.id                                                       AS id1,
                                   t2.id                                                       AS id2,
                                   t1.checkingpeer                                             AS t1checkingpeer,
                                   t1.checkedpeer                                              AS t1checkedpeer,
                                   COALESCE(t1.pointsamount, 0) - COALESCE(t2.pointsamount, 0) AS amount
                            FROM transferredpoints t1
                                     LEFT OUTER JOIN transferredpoints t2
                                                     ON t1.checkingpeer = t2.checkedpeer AND t1.checkedpeer = t2.checkingpeer)

                  SELECT t1checkingpeer, t1checkedpeer, amount
                  FROM temp
                  WHERE id2 > id1
                     OR id2 IS NULL);
END;
$BODY$
    LANGUAGE plpgsql;

--Task 2
CREATE FUNCTION fn_received_xp()
    RETURNS TABLE
            (
                Peer VARCHAR,
                Task VARCHAR,
                XP   BIGINT
            )
AS
$$
BEGIN
    RETURN QUERY SELECT c.peer, c.task, xpamount
                 FROM xp
                          JOIN checks c on c.id = xp."Check"
                          JOIN p2p p ON p."Check" = c.id AND p.state != 'Start'
                          LEFT JOIN verter v on v."Check" = c.id AND v.state != 'Start'
                 WHERE p.state = 'Success'
                   AND (v.state IS NULL OR v.state = 'Success');
END;
$$
    LANGUAGE plpgsql;

--Task 3
CREATE FUNCTION fn_entered_and_never_left_campus(day DATE)
    RETURNS TABLE
            (
                "Peer" VARCHAR
            )
AS
$$
BEGIN
    RETURN QUERY
        WITH those_who_entered_this_day AS
                 (SELECT peer AS name, COUNT(state) AS total_entred
                  FROM timetracking
                  WHERE "Date" = day
                    AND state = 1
                  GROUP BY peer)
        SELECT name
        FROM those_who_entered_this_day
        WHERE total_entred = 1;
END;
$$
    LANGUAGE plpgsql;

--Task 4
CREATE PROCEDURE pr_percentage_of_succesful_and_unsuccesful_checks(INOUT result REFCURSOR)
AS
$$
DECLARE
    scheck NUMERIC = (SELECT COUNT(*) as successful
                      FROM p2p
                               LEFT JOIN verter v on v."Check" = p2p.id AND v.state != 'Start'
                      WHERE p2p.state = 'Success'
                        AND (v.state IS NULL OR v.state = 'Success'));
    total  NUMERIC = (SELECT COUNT(*) as total
                      FROM checks);
BEGIN
    OPEN result FOR
        SELECT ROUND((scheck / total) * 100)::NUMERIC         AS SuccessfulChecks,
               ROUND((total - scheck) / total * 100)::NUMERIC AS UnsuccessfulChecks;
END;
$$
    LANGUAGE plpgsql;

--Task 5
CREATE PROCEDURE pr_prp_changed(INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        (SELECT nickname as Peer, (COALESCE(increase, 0) - COALESCE(decrease, 0)) AS PointsChange
         FROM peers
                  LEFT JOIN
              (SELECT checkingpeer, SUM(pointsamount) AS increase
               FROM transferredpoints
               GROUP BY checkingpeer) AS t ON checkingpeer = peers.nickname
                  LEFT JOIN
              (SELECT checkedpeer, SUM(pointsamount) AS decrease
               FROM transferredpoints
               GROUP BY checkedpeer) AS b ON checkedpeer = peers.nickname
         ORDER BY nickname);
END;
$BODY$
    LANGUAGE plpgsql;

--Task 6
CREATE PROCEDURE pr_prp_changed_by_prp_balance(INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        WITH balance AS (SELECT * FROM fn_prp_balance())
        SELECT name AS Peer, SUM(PointsAmount) AS PointsChange
        FROM (SELECT peer1 AS name, PointsAmount
              FROM balance
              UNION ALL
              SELECT peer2 AS name, (PointsAmount * -1)
              FROM balance) AS temp
        GROUP BY name
        ORDER BY Peer;
END;
$BODY$
    LANGUAGE plpgsql;

--Task 7
CREATE PROCEDURE pr_most_popular_checking_project_in_a_day(INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        WITH counts_of_tasks AS
                 (SELECT "Date" AS Day, task, COUNT(checks.task) AS count
                  FROM checks
                  GROUP BY "Date", task
                  ORDER BY "Date"),

             allDays AS
                 (SELECT DISTINCT "Date"                                                                      AS Day
                                , (SELECT MAX(count) FROM counts_of_tasks WHERE counts_of_tasks.Day = "Date") AS maximum
                  FROM checks
                  ORDER BY Day)

        SELECT allDays.day, task
        FROM allDays
                 LEFT JOIN counts_of_tasks ON counts_of_tasks.Day = allDays.Day AND counts_of_tasks.count = maximum
        ORDER BY 1;
END;
$BODY$
    LANGUAGE plpgsql;

--Task 8
CREATE PROCEDURE pr_check_duration(INOUT result REFCURSOR)
AS
$$
BEGIN
    OPEN result FOR
        WITH last_check AS (SELECT "Check", "Date" + "Time" as timestamp_end
                            FROM p2p
                                     JOIN checks c on c.id = p2p."Check"
                            WHERE state != 'Start'
                            ORDER BY timestamp_end DESC
                            LIMIT 1)
        SELECT timestamp_end - (c2."Date" + p2p."Time") AS time
        FROM last_check
                 JOIN p2p ON p2p."Check" = last_check."Check"
                 JOIN checks c2 on c2.id = last_check."Check"
        WHERE state = 'Start';
END;
$$
    LANGUAGE plpgsql;

-- Task 9
CREATE PROCEDURE pr_complited_tasks_block(block_name VARCHAR, INOUT result REFCURSOR)
AS
$$
BEGIN
    IF (SELECT COUNT(*) FROM tasks WHERE title SIMILAR TO block_name || '[1-9]*%') != 0
    THEN
        OPEN result FOR
            WITH block AS
                    (SELECT * FROM tasks WHERE title SIMILAR TO block_name || '[1-9]+%')
               , temp AS
                (SELECT nickname, task, "Date", x.xpamount
                 FROM peers
                          JOIN checks c ON peers.nickname = c.peer
                          FULL JOIN xp x on c.id = x."Check"
                 WHERE task SIMILAR TO block_name || '[1-9]+%'
                   AND xpamount IS NOT NULL
                 ORDER BY 1, 2)

               , status AS
                (SELECT DISTINCT peers.nickname, block.title, xpamount
                 FROM peers
                          CROSS JOIN block
                          LEFT JOIN temp ON temp.task = block.title AND temp.nickname = peers.nickname
                 ORDER BY 1, 2)

            SELECT nickname AS Peer, (SELECT MAX("Date")::Date FROM temp WHERE p.nickname = temp.nickname) AS Day
            FROM peers p
            WHERE (SELECT s.nickname
                   FROM status s
                   WHERE s.nickname = p.nickname
                     AND xpamount IS NULL
                   LIMIT 1) IS NULL;
    ELSE
        OPEN result FOR SELECT NULL AS no_result;
    END IF;
END;
$$
    LANGUAGE plpgsql;

--Task 10
CREATE PROCEDURE pr_recommended_peer(INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        (WITH all_friends AS
            ((SELECT peers.nickname AS nickname, friends.peer2 AS friend
              FROM peers
                       JOIN friends ON peers.nickname = friends.peer1)
             UNION
             (SELECT peers.nickname AS nickname, friends.peer1 AS friend
              FROM peers
                       JOIN friends ON peers.nickname = friends.peer2)
             ORDER BY 1)
            , recommend AS (SELECT nickname, recommendations.recommendedpeer, count(*) AS count_of_reccomendations
                            FROM all_friends
                                     JOIN recommendations ON friend = recommendations.peer
                            WHERE nickname != recommendations.recommendedpeer
                            GROUP BY 1, 2
                            ORDER BY 1)
            , best_reccomend AS
                (SELECT r1.nickname AS Peer, r1.recommendedpeer AS RecommendedPeer
                 FROM recommend AS r1
                 WHERE r1.count_of_reccomendations = (SELECT max(r2.count_of_reccomendations)
                                                      FROM recommend AS r2
                                                      WHERE r1.nickname = r2.nickname))
         SELECT r1.Peer, r1.recommendedpeer AS RecommendedPeer
         FROM best_reccomend AS r1
         WHERE r1.recommendedpeer = (SELECT max(r2.recommendedpeer)
                                     FROM best_reccomend r2
                                     WHERE r1.Peer = r2.Peer));
END;
$BODY$
    LANGUAGE plpgsql;


-- task 11
CREATE FUNCTION fn_find_amount_for_block(p_block VARCHAR)
    RETURNS SETOF VARCHAR
AS
$BODY$
BEGIN
    RETURN QUERY
        (SELECT DISTINCT peer
         FROM checks
         WHERE split_part(task, '_', 1) SIMILAR TO p_block || '[1-9]*');
END;
$BODY$
    LANGUAGE plpgsql;


CREATE FUNCTION fn_intersect_blocks(p_block_1 VARCHAR, p_block_2 VARCHAR)
    RETURNS SETOF FLOAT
AS
$BODY$
BEGIN
    RETURN QUERY
        (SELECT CAST(count(*) AS FLOAT) / (SELECT count(*) FROM peers) * 100
         FROM (SELECT *
               FROM fn_find_amount_for_block(p_block_1)
               INTERSECT
               SELECT *
               FROM fn_find_amount_for_block(p_block_2)) AS i);
END;
$BODY$
    LANGUAGE plpgsql;

CREATE FUNCTION fn_except_blocks(p_block_1 VARCHAR, p_block_2 VARCHAR)
    RETURNS SETOF FLOAT
AS
$BODY$
BEGIN
    RETURN QUERY
        (SELECT CAST(count(*) AS FLOAT) / (SELECT count(*) FROM peers) * 100
         FROM (SELECT *
               FROM fn_find_amount_for_block(p_block_1)
               EXCEPT
               SELECT *
               FROM fn_find_amount_for_block(p_block_2)) AS e);
END;
$BODY$
    LANGUAGE plpgsql;

CREATE PROCEDURE pr_result_blocks(p_block_1 VARCHAR,
                                  p_block_2 VARCHAR,
                                  INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        (SELECT ROUND(fn_except_blocks(p_block_1, p_block_2))            AS StartedBlock1,
                ROUND(fn_except_blocks(p_block_2, p_block_1))            AS StartedBlock2,
                ROUND(fn_intersect_blocks(p_block_1, p_block_2))         AS StartedBothBlocks,
                ROUND(100 - (fn_except_blocks(p_block_1, p_block_2) + fn_except_blocks(p_block_2, p_block_1) +
                             fn_intersect_blocks(p_block_1, p_block_2))) AS DidntStartAnyBlock);

END;
$BODY$
    LANGUAGE plpgsql;

-- Task 12
CREATE PROCEDURE pr_max_number_of_friends(p_n BIGINT, INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        (WITH all_friends AS
                  ((SELECT peers.nickname AS nickname, friends.peer2 AS friend
                    FROM peers
                             JOIN friends ON peers.nickname = friends.peer1)
                   UNION
                   (SELECT peers.nickname AS nickname, friends.peer1 AS friend
                    FROM peers
                             JOIN friends ON peers.nickname = friends.peer2))
         SELECT nickname AS Peer, count(*) AS FriendsCount
         FROM all_friends
         GROUP BY nickname
         ORDER BY 2 DESC, 1 ASC
         LIMIT p_n);
END;
$BODY$
    LANGUAGE plpgsql;

--Task 13
CREATE PROCEDURE pr_percentage_birthday_successes(INOUT result REFCURSOR)
AS
$$
DECLARE
    success_birthdays_count NUMERIC = (SELECT count(*)
                                       FROM (SELECT DISTINCT ON (p.nickname) c.id AS check_id, peer AS peer
                                             FROM checks c
                                                      JOIN peers p on p.nickname = c.peer
                                             WHERE EXTRACT(DAY FROM c."Date") = EXTRACT(DAY FROM p.birthday)
                                               AND EXTRACT(MONTH FROM c."Date") = EXTRACT(MONTH FROM p.birthday)) as cip
                                                JOIN p2p p ON p."Check" = check_id AND p.state != 'Start'
                                                LEFT JOIN verter v on v."Check" = check_id AND v.state != 'Start'
                                       WHERE p.state = 'Success'
                                         AND (v.state IS NULL OR v.state = 'Success'));
    all_birthdays_count     NUMERIC = (SELECT COUNT(*)
                                       FROM (SELECT DISTINCT ON (p.nickname) c.id AS check_id, peer AS peer
                                             FROM checks c
                                                      JOIN peers p on p.nickname = c.peer
                                             WHERE EXTRACT(DAY FROM c."Date") = EXTRACT(DAY FROM p.birthday)
                                               AND EXTRACT(MONTH FROM c."Date") = EXTRACT(MONTH FROM p.birthday)) as cip2);
BEGIN
    OPEN result FOR
        (SELECT ROUND((success_birthdays_count / all_birthdays_count) * 100)::NUMERIC AS SuccessfulChecks,
                ROUND((all_birthdays_count - success_birthdays_count) / all_birthdays_count *
                      100)::NUMERIC                                                   AS UnsuccessfulChecks);
END;
$$
    LANGUAGE plpgsql;

-- Task 14
CREATE PROCEDURE pr_total_amount_of_xp(INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        (WITH all_success_checks_max_xp AS
                  (SELECT checks.peer AS peer_checked, task, max(xpamount) as xp_max
                   FROM checks
                            FULL JOIN p2p p ON checks.id = p."Check"
                            FULL JOIN xp x on checks.id = x."Check"
                   WHERE p.state = 'Success'
                   GROUP BY peer, task)

         SELECT peer_checked AS peer, SUM(xp_max) AS XP
         FROM all_success_checks_max_xp
         GROUP BY peer_checked
         ORDER BY 2 DESC);
END;
$BODY$
    LANGUAGE plpgsql;


-- Task 15
CREATE FUNCTION fn_peers_with_success(p_task VARCHAR)
    RETURNS TABLE
            (
                "Peer" VARCHAR
            )
AS
$BODY$
BEGIN
    RETURN QUERY
        (SELECT DISTINCT peer
         FROM checks
                  FULL JOIN p2p ON checks.id = p2p."Check"
                  FULL JOIN verter on checks.id = verter."Check"
         WHERE p_task = checks.task
           AND p2p.state = 'Success'
           AND (verter.state = 'Success' OR verter.state IS NULL));

END;
$BODY$
    LANGUAGE plpgsql;

CREATE PROCEDURE pr_peers_did_two_not_third(p_task1 VARCHAR,
                                            p_task2 VARCHAR,
                                            p_task3 VARCHAR,
                                            INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        ((SELECT *
          FROM fn_peers_with_success(p_task1))
         UNION
         (SELECT *
          FROM fn_peers_with_success(p_task2))
         EXCEPT
         (SELECT *
          FROM fn_peers_with_success(p_task3)));
END;
$BODY$
    LANGUAGE plpgsql;

-- Task 16
CREATE PROCEDURE pr_count_of_previous_tasks(INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        (WITH RECURSIVE all_previous AS
                            (SELECT title AS Task, parenttask, 0 AS PrevCount
                             FROM tasks
                             WHERE parenttask is NULL
                             UNION ALL
                             SELECT tasks.title AS Task, tasks.parenttask, ap.PrevCount + 1 AS PrevCount
                             FROM all_previous ap
                                      INNER JOIN tasks ON tasks.parenttask = ap.Task)

         select ap.Task, ap.PrevCount
         from all_previous ap
         ORDER BY ap.Task);
END;
$BODY$
    LANGUAGE plpgsql;

--task 17
CREATE FUNCTION fn_all_checks()
    RETURNS TABLE
            (
                "ID"   BIGINT,
                "Day"  DATE,
                "Task" VARCHAR
            )
AS
$$
BEGIN
    RETURN QUERY
        WITH all_success_check AS
            (SELECT task, "Date", c.id
             FROM xp
                      JOIN checks c on c.id = xp."Check"
                      JOIN peers p on p.nickname = c.peer
                      JOIN tasks t on c.task = t.title
             WHERE xp.xpamount >= t.maxxp * 0.8
             ORDER BY "Date")

           , all_checks AS
            (SELECT c.id::BIGINT, c."Date", ac.task
             FROM checks c
                      LEFT JOIN all_success_check ac ON ac.id = c.id
             ORDER BY c."Date")
        SELECT *
        FROM all_checks;
END;
$$
    LANGUAGE plpgsql;

CREATE FUNCTION fn_count_of_success(day DATE)
    RETURNS BIGINT
AS
$$
DECLARE
    max_count BIGINT = 0;
    counter   BIGINT = 0;
    total     BIGINT = (SELECT MAX("ID")
                        FROM fn_all_checks());
BEGIN

    FOR i IN 1..total
        LOOP
            IF (SELECT "Task" FROM fn_all_checks() c WHERE c."ID" = i AND "Day" = day) IS NOT NULL
            THEN
                counter = counter + 1;
            ELSE
                IF (counter > max_count) THEN max_count = counter; END IF; counter = 0;
            END IF;
        END LOOP;
    RETURN max_count;
END ;
$$
    LANGUAGE plpgsql;

CREATE PROCEDURE pr_lucky_days(number BIGINT, INOUT result REFCURSOR)
AS
$$
BEGIN
    OPEN result FOR
        WITH days AS
                 (SELECT "Day", fn_count_of_success("Day") AS "XP"
                  FROM (SELECT DISTINCT "Day" FROM fn_all_checks()) AS all_day)

        SELECT "Day"
        FROM days
        WHERE "XP" >= number
        ORDER BY 1;
END;
$$
    LANGUAGE plpgsql;

--task 18
CREATE PROCEDURE pr_most_finished_tasks(INOUT result REFCURSOR)
AS
$$
BEGIN
    OPEN result FOR
        WITH ranked_checks AS (SELECT checks.peer,
                                      checks.id,
                                      v.state                                                             AS verter_check,
                                      p.state                                                             AS peer_check,
                                      task,
                                      ROW_NUMBER() OVER (PARTITION BY peer, task ORDER BY checks.id DESC) AS rn
                               FROM checks
                                        LEFT JOIN verter v on checks.id = v."Check"
                                        JOIN p2p p on checks.id = p."Check"
                               WHERE (v.state != 'Start' OR v.state IS NULL)
                                 AND p.state != 'Start')
        SELECT peer, count(*) AS XP
        FROM ranked_checks
        WHERE rn = 1
          AND ((ranked_checks.verter_check = 'Success' OR ranked_checks.verter_check IS NULL) AND
               ranked_checks.peer_check = 'Success')
        GROUP BY peer
        ORDER BY XP DESC
        LIMIT 1;
END;
$$
    LANGUAGE plpgsql;

--task 19
CREATE PROCEDURE pr_most_xp(INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        WITH all_success_check AS
            (SELECT xpamount, nickname, task, "Date"
             FROM xp
                      JOIN checks c on c.id = xp."Check"
                      JOIN peers p on p.nickname = c.peer
             ORDER BY nickname, task, "Date" DESC)

           , all_tasks AS
            (SELECT title,
                    peers.nickname,
                    (SELECT xpamount
                     FROM all_success_check
                     WHERE title = all_success_check.task
                       AND all_success_check.nickname = peers.nickname
                     LIMIT 1) AS exp
             FROM tasks,
                  peers)

           , sum_xp AS
            (SELECT nickname, SUM(exp) AS exp FROM all_tasks GROUP BY nickname ORDER BY 2 DESC)

        SELECT nickname, exp::BIGINT
        FROM sum_xp
        WHERE exp IS NOT NULL
        LIMIT 1;
END;
$BODY$
    LANGUAGE plpgsql;

--task 20
CREATE PROCEDURE pr_most_time_today(INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        WITH current_day_time AS
            (SELECT id, peer, "Time", state FROM timetracking WHERE "Date" = date(current_date) ORDER BY peer, id)

           , total_time AS
            (SELECT peer,
                    SUM((COALESCE((SELECT "Time"
                                   FROM current_day_time t
                                   WHERE state = 2
                                     AND t.id > m.id
                                     AND t.peer = m.peer
                                   LIMIT 1),
                                  clock_timestamp()::time) - "Time"::time)::interval)::time AS fulltime
             FROM current_day_time m
             WHERE state = 1
             GROUP BY 1
             ORDER BY 2 DESC)

        SELECT peer
        FROM total_time
        LIMIT 1;
END;
$BODY$
    LANGUAGE plpgsql;

--task 21
CREATE PROCEDURE pr_visit_before_time(onTime TIME, count BIGINT, INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        WITH all_peers_total_visits AS
                 (SELECT peer, "Date" AS total_visits
                  FROM timetracking
                  WHERE "Time" < onTime
                    AND state = 1
                  GROUP BY peer, "Date")
        SELECT peer
        FROM ((SELECT peer, COUNT(total_visits) AS visits
               FROM all_peers_total_visits
               GROUP BY peer)) AS peers_visits
        WHERE visits >= count;
END;
$BODY$
    LANGUAGE plpgsql;

--task 22
CREATE PROCEDURE pr_peers_exit_in_interval(amountOfDays BIGINT, amountOfExits BIGINT, INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        WITH all_peers_total_visits AS
                 (SELECT peer, "Date", COUNT("Date") AS total_visits
                  FROM timetracking
                  WHERE "Date" >= now() - CONCAT(amountOfDays, ' DAY')::INTERVAL
                    AND state = 2
                  GROUP BY peer, "Date")
        SELECT peer
        FROM ((SELECT peer, COUNT(total_visits) AS visits
               FROM all_peers_total_visits
               WHERE total_visits > 1
               GROUP BY peer)) AS peers_visits
        WHERE visits > amountOfExits;
END;
$BODY$
    LANGUAGE plpgsql;

--task 23
CREATE PROCEDURE pr_last_came(INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        SELECT peer
        FROM (SELECT * FROM timetracking WHERE "Date" = now()::Date AND state = 1 ORDER BY peer, "Time") AS entred_list
        GROUP BY peer
        ORDER BY MIN("Time") DESC
        LIMIT 1;
END;
$BODY$
    LANGUAGE plpgsql;

--task 24
CREATE PROCEDURE pr_yesterday_out_more_then(minutes BIGINT, INOUT result REFCURSOR)
AS
$BODY$
BEGIN
    OPEN result FOR
        WITH current_day_time AS
            (SELECT id, peer, "Time", state
             FROM timetracking
             WHERE "Date" = date(current_date - '1 DAY'::INTERVAL)
             ORDER BY peer, id)

           , exit_time AS
            (SELECT ct."Time" AS "IN"
                  , (SELECT "Time"
                     FROM current_day_time t
                     WHERE t.state = 1
                       AND ct.id < t.id
                       AND ct.peer = t.peer
                     LIMIT 1) AS "OUT"
                  , ct.state
                  , ct.peer
             FROM current_day_time ct
             WHERE ct.state = 2
             ORDER BY peer)

           , total_out_time AS
            (SELECT peer, SUM("OUT" - "IN")::TIME AS total_time FROM exit_time GROUP BY peer)

        SELECT peer
        FROM total_out_time
        WHERE total_time > (minutes * INTERVAL '1 minutes');
END;
$BODY$
    LANGUAGE plpgsql;

--task 25
CREATE FUNCTION fn_total_visits_in_month(month BIGINT, lim TIME DEFAULT '23:59:59')
    RETURNS TABLE
            (
                visits BIGINT
            )
AS
$BODY$
BEGIN
    RETURN QUERY
        WITH all_times_coming AS
                 (SELECT peer, "Date"
                  FROM timetracking
                           JOIN peers p on p.nickname = timetracking.peer
                  WHERE EXTRACT(MONTH FROM "Date") = month
                    AND EXTRACT(MONTH FROM p.birthday) = month
                    AND "Time" < lim
                  GROUP BY peer, "Date")

        SELECT COUNT("Date")::BIGINT AS num
        FROM all_times_coming
        GROUP BY peer;
END;
$BODY$
    LANGUAGE plpgsql;


CREATE PROCEDURE pr_early_month_entries(INOUT result REFCURSOR)
AS
$BODY$
DECLARE
    timeLimit TIME = '12:00:00';
BEGIN
    OPEN result FOR
        WITH all_months AS
            (SELECT number, fn_total_visits_in_month(number) AS count
             FROM generate_series(1, 12) AS month(number)
             GROUP BY number)

           , all_month_with_time_limit AS
            (SELECT number, fn_total_visits_in_month(number, timeLimit) AS count
             FROM generate_series(1, 12) AS month(number)
             GROUP BY number, timeLimit)

           , total_visits AS
                (SELECT number, SUM(count) AS summ FROM all_months GROUP BY number)

           , total_visits_with_limits AS
            (SELECT number, SUM(count) AS summ FROM all_month_with_time_limit GROUP BY number)

        SELECT TO_CHAR(TO_DATE(total_visits.number::text, 'MM'), 'Month') AS "Month"
             , ((total_visits_with_limits.summ::decimal / total_visits.summ::decimal) * 100)::BIGINT AS "EarlyEntries"
        FROM total_visits
                 JOIN total_visits_with_limits ON total_visits.number = total_visits_with_limits.number;
END;
$BODY$
    LANGUAGE plpgsql;