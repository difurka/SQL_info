-- Task 1
CALL pr_drop_tablename_tables();

-- Task 2
BEGIN;
CALL pr_all_functions(null, 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_all_functions(null, 'result');
COMMIT;

-- Task 3
CALL pr_drop_all_dml_triggers(null);

-- Task 4
BEGIN;
CALL pr_find_text_in_body('COUNT', 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_find_text_in_body('EXECUTE', 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_find_text_in_body('AND', 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_find_text_in_body('join', 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_find_text_in_body('WHERE', 'result');
FETCH ALL IN "result";
COMMIT;

BEGIN;
CALL pr_find_text_in_body('DROP', 'result');
FETCH ALL IN "result";
COMMIT;