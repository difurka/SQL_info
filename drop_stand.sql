DROP TABLE IF EXISTS "TableNamePeers" CASCADE;

DROP TABLE IF EXISTS "TableNameTribes" CASCADE;

DROP TABLE IF EXISTS "TableNameBalance" CASCADE;

DROP FUNCTION IF EXISTS fn_count_of_peers_prp_more_then(integer) CASCADE;

DROP FUNCTION IF EXISTS fn_count_of_peers_prp_less_then(integer) CASCADE;

DROP FUNCTION IF EXISTS fn_count_of_peers_prp_diapason(integer, integer) CASCADE;

DROP FUNCTION IF EXISTS fn_total_prp() CASCADE;

DROP FUNCTION IF EXISTS fn_prp_balance(varchar) CASCADE;

DROP FUNCTION IF EXISTS tr_trigger() CASCADE;

DROP PROCEDURE IF EXISTS pr_drop_tablename_tables() CASCADE;

DROP PROCEDURE IF EXISTS pr_all_functions(out bigint, inout refcursor) CASCADE;

DROP PROCEDURE IF EXISTS pr_drop_all_dml_triggers(out bigint) CASCADE;

DROP FUNCTION IF EXISTS fn_find_text(text, text) CASCADE;

DROP PROCEDURE IF EXISTS pr_find_text_in_body(text, inout refcursor) CASCADE;
