DROP TABLE IF EXISTS p2p CASCADE;

DROP TABLE IF EXISTS transferredpoints CASCADE;

DROP TABLE IF EXISTS friends CASCADE;

DROP TABLE IF EXISTS recommendations CASCADE;

DROP TABLE IF EXISTS timetracking CASCADE;

DROP TABLE IF EXISTS verter CASCADE;

DROP TYPE IF EXISTS status CASCADE;

DROP TABLE IF EXISTS xp CASCADE;

DROP TABLE IF EXISTS checks CASCADE;

DROP TABLE IF EXISTS peers CASCADE;

DROP TABLE IF EXISTS tasks CASCADE;

DROP PROCEDURE IF EXISTS pr_percentage_of_succesful_and_unsuccesful_checks(inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_prp_changed(inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_prp_changed_by_prp_balance(inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_most_popular_checking_project_in_a_day(inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_check_duration(inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_complited_tasks_block(varchar, inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_recommended_peer(inout refcursor) CASCADE;

DROP FUNCTION IF EXISTS fn_find_amount_for_block(varchar) CASCADE;

DROP FUNCTION IF EXISTS fn_intersect_blocks(varchar, varchar) CASCADE;

DROP FUNCTION IF EXISTS fn_except_blocks(varchar, varchar) CASCADE;

DROP PROCEDURE IF EXISTS pr_result_blocks(varchar, varchar, inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_max_number_of_friends(bigint, inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_percentage_birthday_successes(inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_total_amount_of_xp(inout refcursor) CASCADE;

DROP FUNCTION IF EXISTS fn_peers_with_success(varchar) CASCADE;

DROP PROCEDURE IF EXISTS pr_peers_did_two_not_third(varchar, varchar, varchar, inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_count_of_previous_tasks(inout refcursor) CASCADE;

DROP FUNCTION IF EXISTS fn_count_of_success(date) CASCADE;

DROP PROCEDURE IF EXISTS pr_lucky_days(bigint, inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_most_finished_tasks(inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_most_xp(inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_most_time_today(inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_visit_before_time(time, bigint, inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_peers_exit_in_interval(bigint, bigint, inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_last_came(inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_yesterday_out_more_then(bigint, inout refcursor) CASCADE;

DROP FUNCTION IF EXISTS fn_total_visits_in_month(bigint, time) CASCADE;

DROP PROCEDURE IF EXISTS pr_early_month_entries(inout refcursor) CASCADE;

DROP FUNCTION IF EXISTS fn_is_parenttask_have_null(varchar) CASCADE;

DROP FUNCTION IF EXISTS fn_check_time(date, time, varchar, integer) CASCADE;

DROP FUNCTION IF EXISTS fn_check_amount(bigint, bigint) CASCADE;

DROP FUNCTION IF EXISTS fn_check_status_p2p(bigint) CASCADE;

DROP PROCEDURE IF EXISTS csv_import(text, text, text) CASCADE;

DROP PROCEDURE IF EXISTS csv_export(text, text, text) CASCADE;

DROP PROCEDURE IF EXISTS update_serial(text) CASCADE;

DROP FUNCTION IF EXISTS fn_last_check_for_this_peer_and_task(varchar, varchar) CASCADE;

DROP FUNCTION IF EXISTS fn_last_check_of_this_task_finished(varchar, varchar) CASCADE;

DROP FUNCTION IF EXISTS fn_last_check_started(varchar, varchar, varchar) CASCADE;

DROP PROCEDURE IF EXISTS add_p2p_check(varchar, varchar, varchar, status, time) CASCADE;

DROP FUNCTION IF EXISTS fn_last_successful_check(varchar, varchar) CASCADE;

DROP PROCEDURE IF EXISTS add_verter_check(varchar, varchar, status, time) CASCADE;

DROP FUNCTION IF EXISTS fn_trg_after_p2p_insert() CASCADE;

DROP FUNCTION IF EXISTS fn_trg_before_xp_insert() CASCADE;

DROP FUNCTION IF EXISTS fn_prp_balance() CASCADE;

DROP FUNCTION IF EXISTS fn_received_xp() CASCADE;

DROP FUNCTION IF EXISTS fn_entered_and_never_left_campus(date) CASCADE;

DROP FUNCTION IF EXISTS fn_all_checks() CASCADE;

