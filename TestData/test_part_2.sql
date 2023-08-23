-- Task 1
CALL add_p2p_check('romildab', 'matinish', 'C3_s21_math', 'Start', '13:13:10');
CALL add_p2p_check('romildab', 'matinish', 'C3_s21_math', 'Success', '13:13:11');
CALL add_p2p_check('romildab', 'matinish', 'C3_s21_math', 'Failure', '13:13:17');  --not be insert

CALL add_p2p_check('eilla', 'romildab', 'C2_s21_string+', 'Success', '13:13:13');
CALL add_p2p_check('eilla', 'romildab', 'C2_s21_string+', 'Start', '13:13:14');
CALL add_p2p_check('eilla', 'romildab', 'C2_s21_string+', 'Failure', '13:13:15');

-- Task 2
CALL add_verter_check('romildab' ,'C3_s21_math', 'Success','12:34:51');
CALL add_verter_check('romildab' ,'C3_s21_math', 'Start','12:34:56');
CALL add_verter_check('romildab' ,'C3_s21_math', 'Failure','12:34:58');
CALL add_verter_check('eilla' ,'C4_s21_decimal', 'Start','12:34:59');
CALL add_verter_check('eilla' ,'C4_s21_decimal', 'Success','12:36:59');

-- Task 4
INSERT INTO XP ("Check", xpamount) VALUES (2, 100);
INSERT INTO XP ("Check", xpamount) VALUES (112, 100); -- not success
INSERT INTO XP ("Check", xpamount) VALUES (344, 100); -- "Check" not exist
INSERT INTO XP ("Check", xpamount) VALUES (2, 700); -- bigger then maxXP
