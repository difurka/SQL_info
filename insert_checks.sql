CALL add_p2p_check('ereva', 'mlivia', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('ereva', 'mlivia', 'C1_SimpleBashUtils', 'Success', '13:30');
CALL add_verter_check('ereva', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('ereva', 'C1_SimpleBashUtils', 'Success','13:31');

CALL add_p2p_check('ereva', 'mlivia', 'C2_s21_string+', 'Start', '14:00');
CALL add_p2p_check('ereva', 'mlivia', 'C2_s21_string+', 'Success', '14:30');
CALL add_verter_check('ereva', 'C2_s21_string+', 'Start','14:30');
CALL add_verter_check('ereva', 'C2_s21_string+', 'Success','14:31');

UPDATE checks
SET "Date" = '2022-07-16'
WHERE peer = 'ereva';

CALL add_p2p_check('ereva', 'matinish', 'C3_s21_math', 'Start', '12:00');
CALL add_p2p_check('ereva', 'matinish', 'C3_s21_math', 'Success', '13:30');
CALL add_verter_check('ereva', 'C3_s21_math', 'Start','13:30');
CALL add_verter_check('ereva', 'C3_s21_math', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-07-20'
WHERE peer = 'ereva' AND task = 'C3_s21_math';

CALL add_p2p_check('ereva', 'sblushin', 'C4_s21_decimal', 'Start', '12:00');
CALL add_p2p_check('ereva', 'sblushin', 'C4_s21_decimal', 'Success', '13:30');
CALL add_verter_check('ereva', 'C4_s21_decimal', 'Start','13:30');
CALL add_verter_check('ereva', 'C4_s21_decimal', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-15'
WHERE peer = 'ereva' AND task = 'C4_s21_decimal';

CALL add_p2p_check('ereva', 'mlivia', 'C5_s21_matrix', 'Start', '12:00');
CALL add_p2p_check('ereva', 'mlivia', 'C5_s21_matrix', 'Success', '13:30');
CALL add_verter_check('ereva', 'C5_s21_matrix', 'Start','13:30');
CALL add_verter_check('ereva', 'C5_s21_matrix', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-20'
WHERE peer = 'ereva' AND task = 'C5_s21_matrix';

CALL add_p2p_check('ereva', 'sblushin', 'C6_SmartCalc_v1.0', 'Start', '12:00');
CALL add_p2p_check('ereva', 'sblushin', 'C6_SmartCalc_v1.0', 'Success', '13:30');
CALL add_verter_check('ereva', 'C6_SmartCalc_v1.0', 'Start','13:30');
CALL add_verter_check('ereva', 'C6_SmartCalc_v1.0', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-28'
WHERE peer = 'ereva' AND task = 'C6_SmartCalc_v1.0';

CALL add_p2p_check('ereva', 'romildab', 'C7_3DViewer_v1.0', 'Start', '12:00');
CALL add_p2p_check('ereva', 'romildab', 'C7_3DViewer_v1.0', 'Success', '13:30');
CALL add_verter_check('ereva', 'C7_3DViewer_v1.0', 'Start','13:30');
CALL add_verter_check('ereva', 'C7_3DViewer_v1.0', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-06'
WHERE peer = 'ereva' AND task = 'C7_3DViewer_v1.0';

CALL add_p2p_check('ereva', 'matinish', 'CPP1_s21_matrix+', 'Start', '12:00');
CALL add_p2p_check('ereva', 'matinish', 'CPP1_s21_matrix+', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-09-17'
WHERE peer = 'ereva' AND task = 'CPP1_s21_matrix+';

CALL add_p2p_check('ereva', 'sblushin', 'CPP2_s21_containers', 'Start', '12:00');
CALL add_p2p_check('ereva', 'sblushin', 'CPP2_s21_containers', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-15'
WHERE peer = 'ereva' AND task = 'CPP2_s21_containers';

CALL add_p2p_check('ereva', 'mlivia', 'CPP3_SmartCalc_v2.0', 'Start', '12:00');
CALL add_p2p_check('ereva', 'mlivia', 'CPP3_SmartCalc_v2.0', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-20'
WHERE peer = 'ereva' AND task = 'CPP3_SmartCalc_v2.0';

CALL add_p2p_check('ereva', 'sblushin', 'CPP4_3DViewer_v2.0', 'Start', '12:00');
CALL add_p2p_check('ereva', 'sblushin', 'CPP4_3DViewer_v2.0', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-27'
WHERE peer = 'ereva' AND task = 'CPP4_3DViewer_v2.0';

CALL add_p2p_check('ereva', 'sblushin', 'CPP5_3DViewer_v2.1', 'Start', '12:00');
CALL add_p2p_check('ereva', 'sblushin', 'CPP5_3DViewer_v2.1', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-28'
WHERE peer = 'ereva' AND task = 'CPP5_3DViewer_v2.1';

CALL add_p2p_check('ereva', 'romildab', 'CPP6_3DViewer_v2.2', 'Start', '12:00');
CALL add_p2p_check('ereva', 'romildab', 'CPP6_3DViewer_v2.2', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-11-06'
WHERE peer = 'ereva' AND task = 'CPP6_3DViewer_v2.2';

CALL add_p2p_check('ereva', 'romildab', 'CPP7_MLP', 'Start', '12:00');
CALL add_p2p_check('ereva', 'romildab', 'CPP7_MLP', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-11-07'
WHERE peer = 'ereva' AND task = 'CPP7_MLP';

CALL add_p2p_check('ereva', 'romildab', 'CPP8_MonitoringSystem', 'Start', '12:00');
CALL add_p2p_check('ereva', 'romildab', 'CPP8_MonitoringSystem', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-11-08'
WHERE peer = 'ereva' AND task = 'CPP8_MonitoringSystem';

CALL add_p2p_check('ereva', 'romildab', 'CPP9_PhotoLab_v1.0', 'Start', '12:00');
CALL add_p2p_check('ereva', 'romildab', 'CPP9_PhotoLab_v1.0', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-11-09'
WHERE peer = 'ereva' AND task = 'CPP9_PhotoLab_v1.0';


CALL add_p2p_check('mmadelai', 'mlivia', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'mlivia', 'C1_SimpleBashUtils', 'Success', '13:30');
CALL add_verter_check('mmadelai', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('mmadelai', 'C1_SimpleBashUtils', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-07-17'
WHERE peer = 'mmadelai' AND task = 'C1_SimpleBashUtils+';

CALL add_p2p_check('mmadelai', 'mlivia', 'C2_s21_string+', 'Start', '14:00');
CALL add_p2p_check('mmadelai', 'mlivia', 'C2_s21_string+', 'Success', '14:30');
CALL add_verter_check('mmadelai', 'C2_s21_string+', 'Start','14:30');
CALL add_verter_check('mmadelai', 'C2_s21_string+', 'Success','14:31');

UPDATE checks
SET "Date" = '2022-07-25'
WHERE peer = 'mmadelai' AND task = 'C2_s21_string+';

CALL add_p2p_check('mmadelai', 'matinish', 'C3_s21_math', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'matinish', 'C3_s21_math', 'Success', '13:30');
CALL add_verter_check('mmadelai', 'C3_s21_math', 'Start','13:30');
CALL add_verter_check('mmadelai', 'C3_s21_math', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-07-28'
WHERE peer = 'mmadelai' AND task = 'C3_s21_math';

CALL add_p2p_check('mmadelai', 'sblushin', 'C4_s21_decimal', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'sblushin', 'C4_s21_decimal', 'Success', '13:30');
CALL add_verter_check('mmadelai', 'C4_s21_decimal', 'Start','13:30');
CALL add_verter_check('mmadelai', 'C4_s21_decimal', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-20'
WHERE peer = 'mmadelai' AND task = 'C4_s21_decimal';

CALL add_p2p_check('mmadelai', 'mlivia', 'C5_s21_matrix', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'mlivia', 'C5_s21_matrix', 'Success', '13:30');
CALL add_verter_check('mmadelai', 'C5_s21_matrix', 'Start','13:30');
CALL add_verter_check('mmadelai', 'C5_s21_matrix', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-29'
WHERE peer = 'mmadelai' AND task = 'C5_s21_matrix';

CALL add_p2p_check('mmadelai', 'sblushin', 'C6_SmartCalc_v1.0', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'sblushin', 'C6_SmartCalc_v1.0', 'Success', '13:30');
CALL add_verter_check('mmadelai', 'C6_SmartCalc_v1.0', 'Start','13:30');
CALL add_verter_check('mmadelai', 'C6_SmartCalc_v1.0', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-30'
WHERE peer = 'mmadelai' AND task = 'C6_SmartCalc_v1.0';

CALL add_p2p_check('mmadelai', 'romildab', 'C7_3DViewer_v1.0', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'romildab', 'C7_3DViewer_v1.0', 'Success', '13:30');
CALL add_verter_check('mmadelai', 'C7_3DViewer_v1.0', 'Start','13:30');
CALL add_verter_check('mmadelai', 'C7_3DViewer_v1.0', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-03'
WHERE peer = 'mmadelai' AND task = 'C7_3DViewer_v1.0';

CALL add_p2p_check('mmadelai', 'matinish', 'CPP1_s21_matrix+', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'matinish', 'CPP1_s21_matrix+', 'Success', '13:30');
CALL add_verter_check('mmadelai', 'CPP1_s21_matrix+', 'Start','13:30');
CALL add_verter_check('mmadelai', 'CPP1_s21_matrix+', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-16'
WHERE peer = 'mmadelai' AND task = 'CPP1_s21_matrix+';

CALL add_p2p_check('mmadelai', 'sblushin', 'CPP2_s21_containers', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'sblushin', 'CPP2_s21_containers', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-20'
WHERE peer = 'mmadelai' AND task = 'CPP2_s21_containers';

CALL add_p2p_check('mmadelai', 'mlivia', 'CPP3_SmartCalc_v2.0', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'mlivia', 'CPP3_SmartCalc_v2.0', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-23'
WHERE peer = 'mmadelai' AND task = 'CPP3_SmartCalc_v2.0';

CALL add_p2p_check('mmadelai', 'sblushin', 'CPP4_3DViewer_v2.0', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'sblushin', 'CPP4_3DViewer_v2.0', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-28'
WHERE peer = 'mmadelai' AND task = 'CPP4_3DViewer_v2.0';

CALL add_p2p_check('mmadelai', 'sblushin', 'CPP5_3DViewer_v2.1', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'sblushin', 'CPP5_3DViewer_v2.1', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-30'
WHERE peer = 'mmadelai' AND task = 'CPP5_3DViewer_v2.1';

CALL add_p2p_check('mmadelai', 'romildab', 'CPP6_3DViewer_v2.2', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'romildab', 'CPP6_3DViewer_v2.2', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-11-03'
WHERE peer = 'mmadelai' AND task = 'CPP6_3DViewer_v2.2';

CALL add_p2p_check('mmadelai', 'romildab', 'CPP7_MLP', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'romildab', 'CPP7_MLP', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-11-06'
WHERE peer = 'mmadelai' AND task = 'CPP7_MLP';

CALL add_p2p_check('mmadelai', 'romildab', 'CPP8_MonitoringSystem', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'romildab', 'CPP8_MonitoringSystem', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-11-08'
WHERE peer = 'mmadelai' AND task = 'CPP8_MonitoringSystem';

CALL add_p2p_check('mmadelai', 'romildab', 'CPP9_PhotoLab_v1.0', 'Start', '12:00');
CALL add_p2p_check('mmadelai', 'romildab', 'CPP9_PhotoLab_v1.0', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-11-09'
WHERE peer = 'mmadelai' AND task = 'CPP9_PhotoLab_v1.0';


CALL add_p2p_check('sblushin', 'mlivia', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('sblushin', 'mlivia', 'C1_SimpleBashUtils', 'Success', '13:30');
CALL add_verter_check('sblushin', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('sblushin', 'C1_SimpleBashUtils', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-17'
WHERE peer = 'sblushin' AND task = 'C1_SimpleBashUtils';

CALL add_p2p_check('sblushin', 'mlivia', 'C2_s21_string+', 'Start', '14:00');
CALL add_p2p_check('sblushin', 'mlivia', 'C2_s21_string+', 'Success', '14:30');
CALL add_verter_check('sblushin', 'C2_s21_string+', 'Start','14:30');
CALL add_verter_check('sblushin', 'C2_s21_string+', 'Success','14:31');

UPDATE checks
SET "Date" = '2022-09-20'
WHERE peer = 'sblushin' AND task = 'C2_s21_string+';

CALL add_p2p_check('sblushin', 'matinish', 'C3_s21_math', 'Start', '12:00');
CALL add_p2p_check('sblushin', 'matinish', 'C3_s21_math', 'Success', '13:30');
CALL add_verter_check('sblushin', 'C3_s21_math', 'Start','13:30');
CALL add_verter_check('sblushin', 'C3_s21_math', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-21'
WHERE peer = 'sblushin' AND task = 'C3_s21_math';

CALL add_p2p_check('sblushin', 'ereva', 'C4_s21_decimal', 'Start', '12:00');
CALL add_p2p_check('sblushin', 'ereva', 'C4_s21_decimal', 'Success', '13:30');
CALL add_verter_check('sblushin', 'C4_s21_decimal', 'Start','13:30');
CALL add_verter_check('sblushin', 'C4_s21_decimal', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-10-26'
WHERE peer = 'sblushin' AND task = 'C4_s21_decimal';

CALL add_p2p_check('sblushin', 'mlivia', 'C5_s21_matrix', 'Start', '12:00');
CALL add_p2p_check('sblushin', 'mlivia', 'C5_s21_matrix', 'Success', '13:30');
CALL add_verter_check('sblushin', 'C5_s21_matrix', 'Start','13:30');
CALL add_verter_check('sblushin', 'C5_s21_matrix', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-10-30'
WHERE peer = 'sblushin' AND task = 'C5_s21_matrix';

CALL add_p2p_check('sblushin', 'ereva', 'C6_SmartCalc_v1.0', 'Start', '12:00');
CALL add_p2p_check('sblushin', 'ereva', 'C6_SmartCalc_v1.0', 'Success', '13:30');
CALL add_verter_check('sblushin', 'C6_SmartCalc_v1.0', 'Start','13:30');
CALL add_verter_check('sblushin', 'C6_SmartCalc_v1.0', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-11-02'
WHERE peer = 'sblushin' AND task = 'C6_SmartCalc_v1.0';

CALL add_p2p_check('sblushin', 'romildab', 'C7_3DViewer_v1.0', 'Start', '12:00');
CALL add_p2p_check('sblushin', 'romildab', 'C7_3DViewer_v1.0', 'Success', '13:30');
CALL add_verter_check('sblushin', 'C7_3DViewer_v1.0', 'Start','13:30');
CALL add_verter_check('sblushin', 'C7_3DViewer_v1.0', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-11-10'
WHERE peer = 'sblushin' AND task = 'C7_3DViewer_v1.0';


CALL add_p2p_check('matinish', 'mlivia', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('matinish', 'mlivia', 'C1_SimpleBashUtils', 'Success', '13:30');
CALL add_verter_check('matinish', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('matinish', 'C1_SimpleBashUtils', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-17'
WHERE peer = 'matinish' AND task = 'C1_SimpleBashUtils';

CALL add_p2p_check('matinish', 'mlivia', 'C2_s21_string+', 'Start', '14:00');
CALL add_p2p_check('matinish', 'mlivia', 'C2_s21_string+', 'Success', '14:30');
CALL add_verter_check('matinish', 'C2_s21_string+', 'Start','14:30');
CALL add_verter_check('matinish', 'C2_s21_string+', 'Success','14:31');

UPDATE checks
SET "Date" = '2022-08-20'
WHERE peer = 'matinish' AND task = 'C2_s21_string+';

CALL add_p2p_check('matinish', 'mlivia', 'C3_s21_math', 'Start', '12:00');
CALL add_p2p_check('matinish', 'mlivia', 'C3_s21_math', 'Success', '13:30');
CALL add_verter_check('matinish', 'C3_s21_math', 'Start','13:30');
CALL add_verter_check('matinish', 'C3_s21_math', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-21'
WHERE peer = 'matinish' AND task = 'C3_s21_math';

CALL add_p2p_check('matinish', 'ereva', 'C4_s21_decimal', 'Start', '12:00');
CALL add_p2p_check('matinish', 'ereva', 'C4_s21_decimal', 'Success', '13:30');
CALL add_verter_check('matinish', 'C4_s21_decimal', 'Start','13:30');
CALL add_verter_check('matinish', 'C4_s21_decimal', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-26'
WHERE peer = 'matinish' AND task = 'C4_s21_decimal';

CALL add_p2p_check('matinish', 'mlivia', 'C5_s21_matrix', 'Start', '12:00');
CALL add_p2p_check('matinish', 'mlivia', 'C5_s21_matrix', 'Success', '13:30');
CALL add_verter_check('matinish', 'C5_s21_matrix', 'Start','13:30');
CALL add_verter_check('matinish', 'C5_s21_matrix', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-30'
WHERE peer = 'matinish' AND task = 'C5_s21_matrix';

CALL add_p2p_check('matinish', 'ereva', 'C6_SmartCalc_v1.0', 'Start', '12:00');
CALL add_p2p_check('matinish', 'ereva', 'C6_SmartCalc_v1.0', 'Success', '13:30');
CALL add_verter_check('matinish', 'C6_SmartCalc_v1.0', 'Start','13:30');
CALL add_verter_check('matinish', 'C6_SmartCalc_v1.0', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-11-02'
WHERE peer = 'matinish' AND task = 'C6_SmartCalc_v1.0';

CALL add_p2p_check('matinish', 'ereva', 'C7_3DViewer_v1.0', 'Start', '12:00');
CALL add_p2p_check('matinish', 'ereva', 'C7_3DViewer_v1.0', 'Success', '13:30');
CALL add_verter_check('matinish', 'C7_3DViewer_v1.0', 'Start','13:30');
CALL add_verter_check('matinish', 'C7_3DViewer_v1.0', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-11-04'
WHERE peer = 'matinish' AND task = 'C7_3DViewer_v1.0';

CALL add_p2p_check('matinish', 'ereva', 'DO1_Linux', 'Start', '12:00');
CALL add_p2p_check('matinish', 'ereva', 'DO1_Linux', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-09'
WHERE peer = 'matinish' AND task = 'DO1_Linux';

CALL add_p2p_check('matinish', 'romildab', 'DO2_Linux_Network', 'Start', '12:00');
CALL add_p2p_check('matinish', 'romildab', 'DO2_Linux_Network', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-11'
WHERE peer = 'matinish' AND task = 'DO2_Linux_Network';

CALL add_p2p_check('matinish', 'romildab', 'DO3_LinuxMonitoring_v1.0', 'Start', '12:00');
CALL add_p2p_check('matinish', 'romildab', 'DO3_LinuxMonitoring_v1.0', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-12'
WHERE peer = 'matinish' AND task = 'DO3_LinuxMonitoring_v1.0';

CALL add_p2p_check('matinish', 'romildab', 'DO4_LinuxMonitoring_v2.0', 'Start', '12:00');
CALL add_p2p_check('matinish', 'romildab', 'DO4_LinuxMonitoring_v2.0', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-16'
WHERE peer = 'matinish' AND task = 'DO4_LinuxMonitoring_v2.0';

CALL add_p2p_check('matinish', 'romildab', 'DO5_SimpleDocker', 'Start', '12:00');
CALL add_p2p_check('matinish', 'romildab', 'DO5_SimpleDocker', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-18'
WHERE peer = 'matinish' AND task = 'DO5_SimpleDocker';

CALL add_p2p_check('matinish', 'romildab', 'DO6_CICD', 'Start', '12:00');
CALL add_p2p_check('matinish', 'romildab', 'DO6_CICD', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-20'
WHERE peer = 'matinish' AND task = 'DO6_CICD';


CALL add_p2p_check('cmerlyn', 'torell', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('cmerlyn', 'torell', 'C1_SimpleBashUtils', 'Success', '13:30');
CALL add_verter_check('cmerlyn', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('cmerlyn', 'C1_SimpleBashUtils', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-17'
WHERE peer = 'cmerlyn' AND task = 'C1_SimpleBashUtils';

CALL add_p2p_check('cmerlyn', 'ereva', 'C2_s21_string+', 'Start', '15:00');
CALL add_p2p_check('cmerlyn', 'ereva', 'C2_s21_string+', 'Success', '15:30');
CALL add_verter_check('cmerlyn', 'C2_s21_string+', 'Start','15:30');
CALL add_verter_check('cmerlyn', 'C2_s21_string+', 'Success','15:31');

UPDATE checks
SET "Date" = '2022-08-20'
WHERE peer = 'cmerlyn' AND task = 'C2_s21_string+';

CALL add_p2p_check('cmerlyn', 'matinish', 'C3_s21_math', 'Start', '12:00');
CALL add_p2p_check('cmerlyn', 'matinish', 'C3_s21_math', 'Success', '13:30');
CALL add_verter_check('cmerlyn', 'C3_s21_math', 'Start','13:30');
CALL add_verter_check('cmerlyn', 'C3_s21_math', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-21'
WHERE peer = 'cmerlyn' AND task = 'C3_s21_math';

CALL add_p2p_check('cmerlyn', 'ereva', 'C4_s21_decimal', 'Start', '12:00');
CALL add_p2p_check('cmerlyn', 'ereva', 'C4_s21_decimal', 'Success', '13:30');
CALL add_verter_check('cmerlyn', 'C4_s21_decimal', 'Start','13:30');
CALL add_verter_check('cmerlyn', 'C4_s21_decimal', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-10'
WHERE peer = 'cmerlyn' AND task = 'C4_s21_decimal';

CALL add_p2p_check('cmerlyn', 'matinish', 'C5_s21_matrix', 'Start', '12:00');
CALL add_p2p_check('cmerlyn', 'matinish', 'C5_s21_matrix', 'Success', '13:30');
CALL add_verter_check('cmerlyn', 'C5_s21_matrix', 'Start','13:30');
CALL add_verter_check('cmerlyn', 'C5_s21_matrix', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-30'
WHERE peer = 'cmerlyn' AND task = 'C5_s21_matrix';

CALL add_p2p_check('cmerlyn', 'ereva', 'C6_SmartCalc_v1.0', 'Start', '12:00');
CALL add_p2p_check('cmerlyn', 'ereva', 'C6_SmartCalc_v1.0', 'Success', '13:30');
CALL add_verter_check('cmerlyn', 'C6_SmartCalc_v1.0', 'Start','13:30');
CALL add_verter_check('cmerlyn', 'C6_SmartCalc_v1.0', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-11-02'
WHERE peer = 'cmerlyn' AND task = 'C6_SmartCalc_v1.0';

CALL add_p2p_check('cmerlyn', 'ereva', 'C7_3DViewer_v1.0', 'Start', '12:00');
CALL add_p2p_check('cmerlyn', 'ereva', 'C7_3DViewer_v1.0', 'Success', '13:30');
CALL add_verter_check('cmerlyn', 'C7_3DViewer_v1.0', 'Start','13:30');
CALL add_verter_check('cmerlyn', 'C7_3DViewer_v1.0', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-11-04'
WHERE peer = 'cmerlyn' AND task = 'C7_3DViewer_v1.0';

CALL add_p2p_check('cmerlyn', 'ereva', 'DO1_Linux', 'Start', '12:00');
CALL add_p2p_check('cmerlyn', 'ereva', 'DO1_Linux', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-09'
WHERE peer = 'cmerlyn' AND task = 'DO1_Linux';

CALL add_p2p_check('cmerlyn', 'romildab', 'DO2_Linux_Network', 'Start', '12:00');
CALL add_p2p_check('cmerlyn', 'romildab', 'DO2_Linux_Network', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-11'
WHERE peer = 'cmerlyn' AND task = 'DO2_Linux_Network';

CALL add_p2p_check('cmerlyn', 'matinish', 'DO3_LinuxMonitoring_v1.0', 'Start', '12:00');
CALL add_p2p_check('cmerlyn', 'matinish', 'DO3_LinuxMonitoring_v1.0', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-12'
WHERE peer = 'cmerlyn' AND task = 'DO3_LinuxMonitoring_v1.0';

CALL add_p2p_check('cmerlyn', 'ereva', 'DO4_LinuxMonitoring_v2.0', 'Start', '12:00');
CALL add_p2p_check('cmerlyn', 'ereva', 'DO4_LinuxMonitoring_v2.0', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-16'
WHERE peer = 'cmerlyn' AND task = 'DO4_LinuxMonitoring_v2.0';

CALL add_p2p_check('cmerlyn', 'matinish', 'DO5_SimpleDocker', 'Start', '12:00');
CALL add_p2p_check('cmerlyn', 'matinish', 'DO5_SimpleDocker', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-18'
WHERE peer = 'cmerlyn' AND task = 'DO5_SimpleDocker';

CALL add_p2p_check('cmerlyn', 'romildab', 'DO6_CICD', 'Start', '12:00');
CALL add_p2p_check('cmerlyn', 'romildab', 'DO6_CICD', 'Success', '13:30');

UPDATE checks
SET "Date" = '2022-10-20'
WHERE peer = 'cmerlyn' AND task = 'DO6_CICD';


CALL add_p2p_check('peachgha', 'romildab', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('peachgha', 'romildab', 'C1_SimpleBashUtils', 'Success', '13:30');
CALL add_verter_check('peachgha', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('peachgha', 'C1_SimpleBashUtils', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-17'
WHERE peer = 'peachgha' AND task = 'C1_SimpleBashUtils';

CALL add_p2p_check('peachgha', 'cmerlyn', 'C2_s21_string+', 'Start', '17:00');
CALL add_p2p_check('peachgha', 'cmerlyn', 'C2_s21_string+', 'Success', '17:30');
CALL add_verter_check('peachgha', 'C2_s21_string+', 'Start','17:30');
CALL add_verter_check('peachgha', 'C2_s21_string+', 'Success','17:31');

UPDATE checks
SET "Date" = '2022-08-20'
WHERE peer = 'peachgha' AND task = 'C2_s21_string+';

CALL add_p2p_check('peachgha', 'ereva', 'C3_s21_math', 'Start', '12:00');
CALL add_p2p_check('peachgha', 'ereva', 'C3_s21_math', 'Success', '13:30');
CALL add_verter_check('peachgha', 'C3_s21_math', 'Start','13:30');
CALL add_verter_check('peachgha', 'C3_s21_math', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-21'
WHERE peer = 'peachgha' AND task = 'C3_s21_math';

CALL add_p2p_check('peachgha', 'ereva', 'C4_s21_decimal', 'Start', '12:00');
CALL add_p2p_check('peachgha', 'ereva', 'C4_s21_decimal', 'Success', '13:30');
CALL add_verter_check('peachgha', 'C4_s21_decimal', 'Start','13:30');
CALL add_verter_check('peachgha', 'C4_s21_decimal', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-26'
WHERE peer = 'peachgha' AND task = 'C4_s21_decimal';

CALL add_p2p_check('peachgha', 'cmerlyn', 'C5_s21_matrix', 'Start', '12:00');
CALL add_p2p_check('peachgha', 'cmerlyn', 'C5_s21_matrix', 'Success', '13:30');
CALL add_verter_check('peachgha', 'C5_s21_matrix', 'Start','13:30');
CALL add_verter_check('peachgha', 'C5_s21_matrix', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-10-26'
WHERE peer = 'peachgha' AND task = 'C5_s21_matrix';


CALL add_p2p_check('romildab', 'cmerlyn', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('romildab', 'cmerlyn', 'C1_SimpleBashUtils', 'Failure', '13:30');

UPDATE checks
SET "Date" = '2022-09-26'
WHERE peer = 'romildab' AND task = 'C1_SimpleBashUtils';

CALL add_p2p_check('romildab', 'ereva', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('romildab', 'ereva', 'C1_SimpleBashUtils', 'Success', '13:30');
CALL add_verter_check('romildab', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('romildab', 'C1_SimpleBashUtils', 'Failure','13:31');

UPDATE checks
SET "Date" = '2022-09-26'
WHERE peer = 'romildab' AND task = 'C1_SimpleBashUtils';

CALL add_p2p_check('romildab', 'torell', 'C1_SimpleBashUtils', 'Start', '14:00');
CALL add_p2p_check('romildab', 'torell', 'C1_SimpleBashUtils', 'Success', '14:30');
CALL add_verter_check('romildab', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('romildab', 'C1_SimpleBashUtils', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-27'
WHERE id = 73;


CALL add_p2p_check('pjian', 'cmerlyn', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('pjian', 'cmerlyn', 'C1_SimpleBashUtils', 'Failure', '13:30');

UPDATE checks
SET "Date" = '2022-09-13'
WHERE peer = 'pjian' AND task = 'C1_SimpleBashUtils';

CALL add_p2p_check('pjian', 'ereva', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('pjian', 'ereva', 'C1_SimpleBashUtils', 'Success', '13:30');
CALL add_verter_check('pjian', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('pjian', 'C1_SimpleBashUtils', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-15'
WHERE id = 75;

CALL add_p2p_check('pjian', 'torell', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('pjian', 'torell', 'C1_SimpleBashUtils', 'Success', '13:30');
CALL add_verter_check('pjian', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('pjian', 'C1_SimpleBashUtils', 'Failure','13:31');

UPDATE checks
SET "Date" = '2022-09-27'
WHERE id = 76;

CALL add_p2p_check('eilla', 'cmerlyn', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('eilla', 'cmerlyn', 'C1_SimpleBashUtils', 'Success', '13:30');
CALL add_verter_check('eilla', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('eilla', 'C1_SimpleBashUtils', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-13'
WHERE peer = 'eilla' AND task = 'C1_SimpleBashUtils';

CALL add_p2p_check('eilla', 'ereva', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('eilla', 'ereva', 'C1_SimpleBashUtils', 'Success', '13:30');
CALL add_verter_check('eilla', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('eilla', 'C1_SimpleBashUtils', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-15'
WHERE id = 78;

CALL add_p2p_check('eilla', 'ereva', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('eilla', 'ereva', 'C1_SimpleBashUtils', 'Success', '13:30');
CALL add_verter_check('eilla', 'C1_SimpleBashUtils', 'Start','13:30');
CALL add_verter_check('eilla', 'C1_SimpleBashUtils', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-08-16'
WHERE id = 79;

CALL add_p2p_check('eilla', 'torell', 'C2_s21_string+', 'Start', '12:00');
CALL add_p2p_check('eilla', 'torell', 'C2_s21_string+', 'Success', '13:30');
CALL add_verter_check('eilla', 'C2_s21_string+', 'Start','13:30');
CALL add_verter_check('eilla', 'C2_s21_string+', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-23'
WHERE peer = 'eilla' AND task = 'C2_s21_string+';

CALL add_p2p_check('eilla', 'ereva', 'C2_s21_string+', 'Start', '12:00');
CALL add_p2p_check('eilla', 'ereva', 'C2_s21_string+', 'Success', '13:30');
CALL add_verter_check('eilla', 'C2_s21_string+', 'Start','13:30');
CALL add_verter_check('eilla', 'C2_s21_string+', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-09-23'
WHERE id = 81;

CALL add_p2p_check('eilla', 'torell', 'C3_s21_math', 'Start', '14:00');
CALL add_p2p_check('eilla', 'torell', 'C3_s21_math', 'Success', '14:30');
CALL add_verter_check('eilla', 'C3_s21_math', 'Start','14:30');
CALL add_verter_check('eilla', 'C3_s21_math', 'Success','14:31');

UPDATE checks
SET "Date" = '2022-10-23'
WHERE peer = 'eilla' AND task = 'C3_s21_math';

CALL add_p2p_check('eilla', 'ereva', 'C3_s21_math', 'Start', '12:00');
CALL add_p2p_check('eilla', 'ereva', 'C3_s21_math', 'Success', '13:30');
CALL add_verter_check('eilla', 'C3_s21_math', 'Start','13:30');
CALL add_verter_check('eilla', 'C3_s21_math', 'Success','13:31');

UPDATE checks
SET "Date" = '2022-10-23'
WHERE id = 83;

CALL add_p2p_check('eilla', 'ereva', 'C4_s21_decimal', 'Start', '14:00');
CALL add_p2p_check('eilla', 'ereva', 'C4_s21_decimal', 'Failure', '14:30');

UPDATE checks
SET "Date" = '2022-11-04'
WHERE peer = 'eilla' AND task = 'C4_s21_decimal';

CALL add_p2p_check('torell', 'ereva', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('torell', 'ereva', 'C1_SimpleBashUtils', 'Failure', '13:30');

UPDATE checks
SET "Date" = '2022-11-04'
WHERE peer = 'torell' AND task = 'C1_SimpleBashUtils';

CALL add_p2p_check('urustyb', 'ereva', 'C1_SimpleBashUtils', 'Start', '14:00');
CALL add_p2p_check('urustyb', 'ereva', 'C1_SimpleBashUtils', 'Failure', '14:30');

UPDATE checks
SET "Date" = '2022-11-04'
WHERE peer = 'urustyb' AND task = 'C1_SimpleBashUtils';

CALL add_p2p_check('urustyb', 'ereva', 'C1_SimpleBashUtils', 'Start', '12:00');
CALL add_p2p_check('urustyb', 'ereva', 'C1_SimpleBashUtils', 'Failure', '13:30');

UPDATE checks
SET "Date" = '2022-11-05'
WHERE id = 87;

CALL add_p2p_check('romildab', 'mlivia', 'C2_s21_string+', 'Start', '14:00');
CALL add_p2p_check('romildab', 'mlivia', 'C2_s21_string+', 'Success', '14:30');
CALL add_verter_check('romildab', 'C2_s21_string+', 'Start','14:30');
CALL add_verter_check('romildab', 'C2_s21_string+', 'Failure','14:31');

UPDATE checks
SET "Date" = '2022-11-07'
WHERE peer = 'romildab' AND task = 'C2_s21_string+';

CALL add_p2p_check('romildab', 'mlivia', 'C2_s21_string+', 'Start', '16:00');
CALL add_p2p_check('romildab', 'mlivia', 'C2_s21_string+', 'Success', '16:30');
CALL add_verter_check('romildab', 'C2_s21_string+', 'Start','16:30');
CALL add_verter_check('romildab', 'C2_s21_string+', 'Success','16:31');

UPDATE checks
SET "Date" = '2022-11-07'
WHERE id = 89;

CALL add_p2p_check('rleonard', 'mlivia', 'C2_s21_string+', 'Start', '17:00');
CALL add_p2p_check('rleonard', 'mlivia', 'C2_s21_string+', 'Success', '17:30');
CALL add_verter_check('rleonard', 'C2_s21_string+', 'Start','17:30');
CALL add_verter_check('rleonard', 'C2_s21_string+', 'Success','17:31');

UPDATE checks
SET "Date" = '2022-11-07'
WHERE peer = 'rleonard' AND task = 'C2_s21_string+';

CALL add_p2p_check('cote', 'mlivia', 'C1_SimpleBashUtils', 'Start', '17:10');
CALL add_p2p_check('cote', 'mlivia', 'C1_SimpleBashUtils', 'Success', '17:40');
CALL add_verter_check('cote', 'C1_SimpleBashUtils', 'Start','17:30');
CALL add_verter_check('cote', 'C1_SimpleBashUtils', 'Success','17:31');

UPDATE checks
SET "Date" = '2022-11-07'
WHERE peer = 'cote' AND task = 'C1_SimpleBashUtils';

CALL add_p2p_check('urustyb', 'ereva', 'C1_SimpleBashUtils', 'Start', '18:00');
CALL add_p2p_check('urustyb', 'ereva', 'C1_SimpleBashUtils', 'Failure', '18:30');

UPDATE checks
SET "Date" = '2022-11-07'
WHERE id = 92;

CALL add_p2p_check('urustyb', 'mlivia', 'C1_SimpleBashUtils', 'Start', '16:00');
CALL add_p2p_check('urustyb', 'mlivia', 'C1_SimpleBashUtils', 'Success', '16:30');
CALL add_verter_check('urustyb', 'C1_SimpleBashUtils', 'Start','16:30');
CALL add_verter_check('urustyb', 'C1_SimpleBashUtils', 'Success','16:31');

UPDATE checks
SET "Date" = '2022-11-07'
WHERE id = 93;

CALL add_p2p_check('rleonard', 'mlivia', 'C3_s21_math', 'Start', '17:00');
CALL add_p2p_check('rleonard', 'mlivia', 'C3_s21_math', 'Success', '17:30');
CALL add_verter_check('rleonard', 'C3_s21_math', 'Start','17:30');
CALL add_verter_check('rleonard', 'C3_s21_math', 'Success','17:31');

UPDATE checks
SET "Date" = '2022-11-07'
WHERE peer = 'rleonard' AND task = 'C3_s21_math';

CALL add_p2p_check('urustyb', 'ereva', 'C2_s21_string+', 'Start', '18:00');
CALL add_p2p_check('urustyb', 'ereva', 'C2_s21_string+', 'Failure', '18:30');

UPDATE checks
SET "Date" = '2022-11-07'
WHERE peer = 'urustyb' AND task = 'C2_s21_string+';

CALL add_p2p_check('cote', 'mlivia', 'C2_s21_string+', 'Start', '19:00');
CALL add_p2p_check('cote', 'mlivia', 'C2_s21_string+', 'Success', '19:30');
CALL add_verter_check('cote', 'C2_s21_string+', 'Start','20:30');
CALL add_verter_check('cote', 'C2_s21_string+', 'Success','20:31');

UPDATE checks
SET "Date" = '2022-11-07'
WHERE id = 96;

CALL add_p2p_check('urustyb', 'ereva', 'C2_s21_string+', 'Start', '18:00');
CALL add_p2p_check('urustyb', 'ereva', 'C2_s21_string+', 'Failure', '18:30');

UPDATE checks
SET "Date" = '2022-11-07'
WHERE id = 97;


CALL add_p2p_check('rleonard', 'mlivia', 'C4_s21_decimal', 'Start', '17:00');
CALL add_p2p_check('rleonard', 'mlivia', 'C4_s21_decimal', 'Success', '17:30');
CALL add_verter_check('rleonard', 'C4_s21_decimal', 'Start','17:30');
CALL add_verter_check('rleonard', 'C4_s21_decimal', 'Success','17:31');

UPDATE checks
SET "Date" = '2022-11-20'
WHERE peer = 'rleonard' AND task = 'C4_s21_decimal';

CALL add_p2p_check('cote', 'mlivia', 'C3_s21_math', 'Start', '17:10');
CALL add_p2p_check('cote', 'mlivia', 'C3_s21_math', 'Success', '17:40');
CALL add_verter_check('cote', 'C3_s21_math', 'Start','17:40');
CALL add_verter_check('cote', 'C3_s21_math', 'Success','17:41');

UPDATE checks
SET "Date" = '2022-11-20'
WHERE peer = 'cote' AND task = 'C3_s21_math';

CALL add_p2p_check('urustyb', 'ereva', 'C2_s21_string+', 'Start', '18:00');
CALL add_p2p_check('urustyb', 'ereva', 'C2_s21_string+', 'Failure', '18:30');

UPDATE checks
SET "Date" = '2022-11-20'
WHERE id = 100;

CALL add_p2p_check('urustyb', 'mlivia', 'C2_s21_string+', 'Start', '19:00');
CALL add_p2p_check('urustyb', 'mlivia', 'C2_s21_string+', 'Success', '19:30');
CALL add_verter_check('urustyb', 'C2_s21_string+', 'Start','19:30');
CALL add_verter_check('urustyb', 'C2_s21_string+', 'Success','19:31');

UPDATE checks
SET "Date" = '2022-11-20'
WHERE id = 101;


CALL add_p2p_check('rleonard', 'mlivia', 'C5_s21_matrix', 'Start', '14:00');
CALL add_p2p_check('rleonard', 'mlivia', 'C5_s21_matrix', 'Success', '14:30');
CALL add_verter_check('rleonard', 'C5_s21_matrix', 'Start','14:30');
CALL add_verter_check('rleonard', 'C5_s21_matrix', 'Success','14:31');

UPDATE checks
SET "Date" = '2022-11-21'
WHERE peer = 'rleonard' AND task = 'C5_s21_matrix';

CALL add_p2p_check('cote', 'mlivia', 'C4_s21_decimal', 'Start', '17:10');
CALL add_p2p_check('cote', 'mlivia', 'C4_s21_decimal', 'Success', '17:40');
CALL add_verter_check('cote', 'C4_s21_decimal', 'Start','17:40');
CALL add_verter_check('cote', 'C4_s21_decimal', 'Success','17:41');

UPDATE checks
SET "Date" = '2022-11-21'
WHERE peer = 'cote' AND task = 'C4_s21_decimal';

CALL add_p2p_check('urustyb', 'mlivia', 'C4_s21_decimal', 'Start', '19:00');
CALL add_p2p_check('urustyb', 'mlivia', 'C4_s21_decimal', 'Success', '19:30');
CALL add_verter_check('urustyb', 'C4_s21_decimal', 'Start','19:30');
CALL add_verter_check('urustyb', 'C4_s21_decimal', 'Failure','19:31');

UPDATE checks
SET "Date" = '2022-11-21'
WHERE id = 104;

CALL add_p2p_check('urustyb', 'mlivia', 'C4_s21_decimal', 'Start', '20:00');
CALL add_p2p_check('urustyb', 'mlivia', 'C4_s21_decimal', 'Success', '20:30');
CALL add_verter_check('urustyb', 'C4_s21_decimal', 'Start','20:30');
CALL add_verter_check('urustyb', 'C4_s21_decimal', 'Failure','20:31');

UPDATE checks
SET "Date" = '2022-11-21'
WHERE id = 105;

CALL add_p2p_check('urustyb', 'mlivia', 'C4_s21_decimal', 'Start', '21:00');
CALL add_p2p_check('urustyb', 'mlivia', 'C4_s21_decimal', 'Success', '21:30');
CALL add_verter_check('urustyb', 'C4_s21_decimal', 'Start','21:30');
CALL add_verter_check('urustyb', 'C4_s21_decimal', 'Failure','21:31');

UPDATE checks
SET "Date" = '2022-11-21'
WHERE id = 106;


CALL add_p2p_check('urustyb', 'mlivia', 'C4_s21_decimal', 'Start', '21:00');
CALL add_p2p_check('urustyb', 'mlivia', 'C4_s21_decimal', 'Success', '21:30');
CALL add_verter_check('urustyb', 'C4_s21_decimal', 'Start','21:30');
CALL add_verter_check('urustyb', 'C4_s21_decimal', 'Success','21:31');

UPDATE checks
SET "Date" = '2022-11-22'
WHERE id = 107;

CALL add_p2p_check('cote', 'mlivia', 'C5_s21_matrix', 'Start', '22:10');
CALL add_p2p_check('cote', 'mlivia', 'C5_s21_matrix', 'Success', '22:40');
CALL add_verter_check('cote', 'C5_s21_matrix', 'Start','22:40');
CALL add_verter_check('cote', 'C5_s21_matrix', 'Failure','22:41');

UPDATE checks
SET "Date" = '2022-11-22'
WHERE id = 108;

CALL add_p2p_check('cote', 'mlivia', 'C5_s21_matrix', 'Start', '23:10');
CALL add_p2p_check('cote', 'mlivia', 'C5_s21_matrix', 'Success', '23:40');
CALL add_verter_check('cote', 'C5_s21_matrix', 'Start','23:40');
CALL add_verter_check('cote', 'C5_s21_matrix', 'Success','23:41');

UPDATE checks
SET "Date" = '2022-11-22'
WHERE id = 109;

CALL add_p2p_check('cote', 'mlivia', 'C6_SmartCalc_v1.0', 'Start', '23:10');

UPDATE checks
SET "Date" = '2022-11-24'
WHERE id = 110;