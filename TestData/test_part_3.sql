-- Task 1
SELECT *
FROM fn_prp_balance();

-- Task 2
SELECT *
FROM fn_received_xp();

-- Task 3
SELECT *
FROM fn_entered_and_never_left_campus('2022-11-14');

SELECT *
FROM fn_entered_and_never_left_campus('2022-11-15');

-- Task 4
BEGIN;
CALL pr_percentage_of_succesful_and_unsuccesful_checks('result');
FETCH ALL IN "result";
COMMIT;

-- Task 5
BEGIN;
CALL pr_prp_changed('result');
FETCH ALL IN "result";
COMMIT;

-- Task 6
BEGIN;
CALL pr_prp_changed_by_prp_balance('result');
FETCH ALL IN "result";
COMMIT;

-- Task 7
BEGIN;
CALL pr_most_popular_checking_project_in_a_day('result');
FETCH ALL IN "result";
COMMIT;

-- Task 8
BEGIN;
CALL pr_check_duration('result');
FETCH ALL IN "result";
COMMIT;

-- Task 9
BEGIN;
CALL pr_complited_tasks_block('CU', 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_complited_tasks_block('C', 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_complited_tasks_block('CPP', 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_complited_tasks_block('DO', 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_complited_tasks_block('A', 'result');
FETCH ALL IN "result";
COMMIT;

-- Task 10
BEGIN;
CALL pr_recommended_peer('result');
FETCH ALL IN "result";
COMMIT;

-- Task 11
BEGIN;
CALL pr_result_blocks('C', 'CPP', 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_result_blocks('DO', 'CPP', 'result');
FETCH ALL IN "result";
COMMIT;

-- Task 12
BEGIN;
CALL pr_max_number_of_friends(3, 'result');
FETCH ALL IN "result";
COMMIT;

-- Task 13
BEGIN;
CALL pr_percentage_birthday_successes('result');
FETCH ALL IN "result";
COMMIT;

-- Task 14
BEGIN;
CALL pr_total_amount_of_xp('result');
FETCH ALL IN "result";
COMMIT;

-- Task 15
BEGIN;
CALL pr_peers_did_two_not_third('C2_s21_string+', 'C7_3DViewer_v1.0', 'CPP7_MLP', 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_peers_did_two_not_third('C2_s21_string+', 'C1_SimpleBashUtils', 'C3_s21_math', 'result');
FETCH ALL IN "result";
COMMIT;

-- Task 16
BEGIN;
CALL pr_count_of_previous_tasks('result');
FETCH ALL IN "result";
COMMIT;

-- Task 17
BEGIN;
CALL pr_lucky_days(2, 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_lucky_days(3, 'result');
FETCH ALL IN "result";
COMMIT;

-- Task 18
BEGIN;
CALL pr_most_finished_tasks('result');
FETCH ALL IN "result";
COMMIT;

-- Task 19
BEGIN;
CALL pr_most_xp('result');
FETCH ALL IN "result";
COMMIT;

-- Task 20
BEGIN;
CALL pr_most_time_today('result');
FETCH ALL IN "result";
COMMIT;

-- Task 21
BEGIN;
CALL pr_visit_before_time('12:30:00', 4, 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_visit_before_time('12:30:00', 7, 'result');
FETCH ALL IN "result";
COMMIT;

-- Task 22
BEGIN;
CALL pr_peers_exit_in_interval(15, 1, 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_peers_exit_in_interval(15, 2, 'result');
FETCH ALL IN "result";
COMMIT;

-- Task 23
BEGIN;
CALL pr_last_came('result');
FETCH ALL IN "result";
COMMIT;

-- Task 24
BEGIN;
CALL pr_yesterday_out_more_then(10, 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_yesterday_out_more_then(500, 'result');
FETCH ALL IN "result";
COMMIT;

-- Task 25
BEGIN;
CALL pr_early_month_entries('result');
FETCH ALL IN "result";
COMMIT;
