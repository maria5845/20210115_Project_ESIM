--소수점 2자리 함수 생성
create function to_ch2 (value numeric)
returns text language sql as $$
select rtrim(to_char(value, 'FM999,999,999,990.99'), '.')$$;

-- Drop table

-- DROP TABLE public.t_vision_var_mapp;

CREATE TABLE public.t_vision_var_mapp (
	vision_gubun varchar(100) NOT NULL,
	var_id varchar(100) NOT NULL
);

-- Permissions

ALTER TABLE public.t_vision_var_mapp OWNER TO pieuser;
GRANT ALL ON TABLE public.t_vision_var_mapp TO pieuser;

INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A1U_max', 'Upper_Limit_of_A1_Dimension_Upper_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A1U_min', 'Lower_Limit_of_A1_Dimension_Upper_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A2U_max', 'Upper_Limit_of_A2_Dimension_Upper_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A2U_min', 'Lower_Limit_of_A2_Dimension_Upper_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A3U_max', 'Upper_Limit_of_A3_Dimension_Upper_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A3U_min', 'Lower_Limit_of_A3_Dimension_Upper_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A4U_max', 'Upper_Limit_of_A4_Dimension_Upper_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A4U_min', 'Lower_Limit_of_A4_Dimension_Upper_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A5U_max', 'Upper_Limit_of_A5_Dimension_Upper_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A5U_min', 'Lower_Limit_of_A5_Dimension_Upper_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A6U_max', 'Upper_Limit_of_A6_Dimension_Upper_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A6U_min', 'Lower_Limit_of_A6_Dimension_Upper_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A1L_max', 'Upper_Limit_of_A1_Dimension_Lower_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A1L_min', 'Lower_Limit_of_A1_Dimension_Lower_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A2L_max', 'Upper_Limit_of_A2_Dimension_Lower_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A2L_min', 'Lower_Limit_of_A2_Dimension_Lower_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A3L_max', 'Upper_Limit_of_A3_Dimension_Lower_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A3L_min', 'Lower_Limit_of_A3_Dimension_Lower_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A4L_max', 'Upper_Limit_of_A4_Dimension_Lower_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A4L_min', 'Lower_Limit_of_A4_Dimension_Lower_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A5L_max', 'Upper_Limit_of_A5_Dimension_Lower_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A5L_min', 'Lower_Limit_of_A5_Dimension_Lower_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A6L_max', 'Upper_Limit_of_A6_Dimension_Lower_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('A6L_min', 'Lower_Limit_of_A6_Dimension_Lower_Vision');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('SM1_max', 'Upper_Limit_of_Sepa_MissMatch');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('SM1_min', 'Lower_Limit_of_Sepa_MissMatch');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('SM2_max', 'Upper_Limit_of_Sepa_MissMatch');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('SM2_min', 'Lower_Limit_of_Sepa_MissMatch');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('SM3_max', 'Upper_Limit_of_Sepa_MissMatch');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('SM3_min', 'Lower_Limit_of_Sepa_MissMatch');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('SM4_max', 'Upper_Limit_of_Sepa_MissMatch');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('SM4_min', 'Lower_Limit_of_Sepa_MissMatch');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('TW_max', 'Upper_Limit_of_Tab_Width_Cathode');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('TW_min', 'Lower_Limit_of_Tab_Width_Cathode');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('TS_U_max', 'Upper_Limit_of_Tab_Side');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('TS_U_min', 'Lower_Limit_of_Tab_Side');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('TW_I_max', 'Upper_Limit_of_Tab_Width_Anode');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('TW_I_min', 'Lower_Limit_of_Tab_Width_Anode');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('TH_A_max', 'Upper_Limit_of_Tab_Height');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('TH_A_min', 'Lower_Limit_of_Tab_Height');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('TS_A_max', 'Upper_Limit_of_Tab_Side');
INSERT INTO t_vision_var_mapp (vision_gubun, var_id) VALUES('TS_A_min', 'Lower_Limit_of_Tab_Side');


UPDATE t_set_ctq SET chart_jsn='[{"id":"chart1","title":"A1U/A2U","var_arr":["A1U","A2U"]},{"id":"chart2","title":"A2U/A3U","var_arr":["A2U","A3U"]},{"id":"chart3","title":"A4U/TS_U","var_arr":["A4U","TS_U"]},{"id":"chart4","title":"A5U/A6U","var_arr":["A5U","A6U"]},{"id":"chart5","title":"A2L/A3L/A4L/TS_U","var_arr":["A2L","A3L","A4L","TS_U"]},{"id":"chart6","title":"TW_I/TW/A5L/A6L","var_arr":["TW_I","TW","A5L","A6L"]},{"id":"chart7","title":"A5L/A6L/TH_A/TW","var_arr":["A5L","A6L","TH_A","TW"]},{"id":"chart8","title":"A6L/TH_A","var_arr":["A6L","TH_A"]},{"id":"9","title":"SM2/SM3/SM4","var_arr":["SM2","SM3","SM4"]}]' WHERE user_id='admin';
UPDATE t_set_ctq SET chart_jsn='[{"id":"chart1","title":"A1U/A2U","var_arr":["A1U","A2U"]},{"id":"chart2","title":"A2U/A3U","var_arr":["A2U","A3U"]},{"id":"chart3","title":"A4U/TS_U","var_arr":["A4U","TS_U"]},{"id":"chart4","title":"A5U/A6U","var_arr":["A5U","A6U"]},{"id":"chart5","title":"A2L/A3L/A4L/TS_U","var_arr":["A2L","A3L","A4L","TS_U"]},{"id":"chart6","title":"TW_I/TW/A5L/A6L","var_arr":["TW_I","TW","A5L","A6L"]},{"id":"chart7","title":"A5L/A6L/TH_A/TW","var_arr":["A5L","A6L","TH_A","TW"]},{"id":"chart8","title":"A6L/TH_A","var_arr":["A6L","TH_A"]},{"id":"9","title":"SM2/SM3/SM4","var_arr":["SM2","SM3","SM4"]}]' WHERE user_id='padmin';

delete t_ctq_var_info;
UPDATE t_ctq_var_info SET var_id='A2U', var_gr='CTQ', var_nm='A2U', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=22;
UPDATE t_ctq_var_info SET var_id='A1U', var_gr='CTQ', var_nm='A1U', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=1;
UPDATE t_ctq_var_info SET var_id='A3U', var_gr='CTQ', var_nm='A3U', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=24;
UPDATE t_ctq_var_info SET var_id='A4U', var_gr='CTQ', var_nm='A4U', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=25;
UPDATE t_ctq_var_info SET var_id='A5U', var_gr='CTQ', var_nm='A5U', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=27;
UPDATE t_ctq_var_info SET var_id='A6U', var_gr='CTQ', var_nm='A6U', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=28;
UPDATE t_ctq_var_info SET var_id='A1L', var_gr='CTQ', var_nm='A1L', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=29;
UPDATE t_ctq_var_info SET var_id='A2L', var_gr='CTQ', var_nm='A2L', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=30;
UPDATE t_ctq_var_info SET var_id='A3L', var_gr='CTQ', var_nm='A3L', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=31;
UPDATE t_ctq_var_info SET var_id='A4L', var_gr='CTQ', var_nm='A4L', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=32;
UPDATE t_ctq_var_info SET var_id='TW_I', var_gr='CTQ', var_nm='TW_I', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=34;
UPDATE t_ctq_var_info SET var_id='TW', var_gr='CTQ', var_nm='TW', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=35;
UPDATE t_ctq_var_info SET var_id='A5L', var_gr='CTQ', var_nm='A5L', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=36;
UPDATE t_ctq_var_info SET var_id='A6L', var_gr='CTQ', var_nm='A6L', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=37;
UPDATE t_ctq_var_info SET var_id='SM1', var_gr='CTQ', var_nm='SM1', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=39;
UPDATE t_ctq_var_info SET var_id='SM2', var_gr='CTQ', var_nm='SM2', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=40;
UPDATE t_ctq_var_info SET var_id='SM3', var_gr='CTQ', var_nm='SM3', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=41;
UPDATE t_ctq_var_info SET var_id='SM4', var_gr='CTQ', var_nm='SM4', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=42;
UPDATE t_ctq_var_info SET var_id='TS_U', var_gr='CTQ', var_nm='TSU', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=26;
UPDATE t_ctq_var_info SET var_id='TH_A', var_gr='CTQ', var_nm='TH', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=38;
UPDATE t_ctq_var_info SET var_id='TS_A', var_gr='CTQ', var_nm='TS', var_desc=NULL, dvc_id='Lami', use_yn='Y' WHERE ctq_var_seq=33;


-- Drop table

-- DROP TABLE public.t_alarm_trouble_info;

CREATE TABLE public.t_alarm_trouble_info (
	var_id varchar(100) NOT NULL,
	var_gr varchar(30) NULL,
	alarm_cd float8 NOT NULL,
	trouble_cd varchar(100) NOT NULL,
	loss_detail_cd varchar(100) NULL
);

-- Permissions

ALTER TABLE public.t_alarm_trouble_info OWNER TO pieuser;
GRANT ALL ON TABLE public.t_alarm_trouble_info TO pieuser;

INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 1, '001_Emergency_01', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 2, '002_Emergency_02', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 3, '003_Emergency_03', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 4, '004_Emergency_04', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 5, '005_Emergency_05', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 6, '006_MGZ_ULD_Emergency', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 7, '007_Main_Air_Pressure_01_Low', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 8, '008_Main_Air_Pressure_02_Low', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 9, '009_Main_Air_Pressure_03_Low', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 10, '010_Main_Power_NFB_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 11, '011_UMAC_Stop_Error', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 12, '012_UMAC1_Comm_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 13, '013_UMAC2_Comm_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 14, '014_UMAC_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 15, '015_Vision_Ready_Off_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 16, '016_Vision_Comm_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 17, '017_Host_Comm_check_Error', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 20, '020_Front_DOOR_OPEN_01', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 21, '021_Front_DOOR_OPEN_02', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 22, '022_Front_DOOR_OPEN_03', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 23, '023_Front_DOOR_OPEN_04', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 24, '024_Back_DOOR_OPEN_01', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 25, '025_Back_DOOR_OPEN_02', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 26, '026_Back_DOOR_OPEN_03', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 27, '027_Back_DOOR_OPEN_04', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 28, '028_Back_DOOR_OPEN_05', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 29, '029_Back_DOOR_OPEN_06', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 30, '030_Back_DOOR_OPEN_07', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 31, '031_Back_DOOR_OPEN_08', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 32, '032_Front_DOOR_OPEN_05', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 33, '033_Front_DOOR_OPEN_06', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 34, '034_Front_DOOR_OPEN_07', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 35, '035_Front_DOOR_OPEN_08', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 36, '036_Back_DOOR_OPEN_09', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 37, '037_Back_DOOR_OPEN_10', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 38, '038_Back_DOOR_OPEN_11', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 39, '039_Back_DOOR_OPEN_12', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 40, '040_Back_DOOR_OPEN_13', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 41, '041_Front_DOOR_OPEN_09', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 42, '042_Front_DOOR_OPEN_10', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 43, '043_Front_DOOR_OPEN_11', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 44, '044_Front_DOOR_OPEN_12', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 45, '045_Back_DOOR_OPEN_14', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 46, '046_Back_DOOR_OPEN_15', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 47, '047_Back_DOOR_OPEN_16', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 50, '050_Winding_Group_Servo_Power_NFB_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 51, '051_Cutting_Group_Servo_Power_NFB_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 52, '052_EPC_Group_Servo_Power_NFB_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 53, '053_UMAC_PC_Input_DC24V_Power_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 54, '054_PLC_Output_DC24V_Power_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 55, '055_UMAC_Output_DC24V_Power_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 56, '056_UMAC_15V_Power_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 57, '057_Electrode_Lamp_DC24V_Power_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 58, '058_Laser_pointer_DC24V_Power_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 59, '059_Safety_Control_Power_MC_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 60, '060_UMAC_Control_Power_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 61, '061_EPC_Control_AC220V_Power_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 62, '062_UPS_Fualt', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 63, '063_UPS_Battery_Low', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 64, '064_UPS_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 65, '065_Upper_Electrod_Unwinder1_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 66, '066_Center_Electrod_Unwinder1_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 67, '067_Lower_Electrod_Unwinder1_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 68, '068_Upper_Sepa_Rewinder_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 69, '069_Upper_Sepa_Unwinder_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 70, '070_Lower_Sepa_Rewinder_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 71, '071_Lower_Sepa_Unwinder_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 72, '072_Upper_Pet_Unwinder_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 73, '073_Lower_Pet_Unwinder_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 74, '074_Upper_Electrod_Cutting_Fwd_Bwd_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 75, '075_Center_Electrod_Cutting_Fwd_Bwd_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 76, '076_Lower_Electrod_Cutting_Fwd_Bwd_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 77, '077_Upper_Electrod_Cutting_Up_Dn_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 78, '078_Upper_Electrod_Cutting_Feeding_belt_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 79, '079_Center_Electrod_Cutting_Up_Dn_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 80, '080_Center_Electrod_Cutting_Feeding_belt_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 81, '081_Center_Electrod_Uni_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 82, '082_Up~Lo_Electrod_Uni_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 83, '083_Lower_Electrod_Cutting_Up_Dn_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 84, '084_Lower_Electrod_Cutting_Feeding_belt_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 85, '085_Upper_Electrod_EPC_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 86, '086_Center_Electrod_EPC_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 87, '087_Lower_Electrod_EPC_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 88, '088_Upper_Sepa_EPC_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 89, '089_Lower_Sepa_EPC_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 90, '090_Upper_Electrod_Spool_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 91, '091_Center_Electrod_Spool_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 92, '092_Lower_Electrod_Spool_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 93, '093_Upper_Electrod_EPC_Ctrl_power_CP_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 94, '094_Center_Electrod_EPC_Ctrl_power_CP_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 95, '095_Lower_Electrod_EPC_Ctrl_power_CP_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 96, '096_Upper_Sepa_EPC_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 97, '097_Lower_Sepa_EPC_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 98, '098_Winder_group_servo_power_MC_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 99, '099_Cutting_group_servo_power_MC_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 100, '100_EPC_group_servo_power_MC_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 101, '101_Diverter_Motor1_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 102, '102_Diverter_Motor2_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 130, '130_Heater_Panel_Main_NFB_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 131, '131_Heater_Panel_Servo_power_NFB_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 132, '132_Ring_Blow1_NFB_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 133, '133_Ring_Blow1_THR_Trip', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 134, '134_Ring_Blow2_NFB_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 135, '135_Ring_Blow2_THR_Trip', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 136, '136_Dust_Collect1_NFB_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 137, '137_Dust_Collect1_THR_Trip', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 138, '138_Dust_Collect2_NFB_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 139, '139_Dust_Collect2_THR_Trip', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 140, '140_Upper_Pet_Rewinder_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 141, '141_Lower_Pet_Rewinder_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 142, '142_Final_Cutting_Fwd_Bwd_error_Servo_CP_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 143, '143_Lami_Roller_Upper_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 144, '144_Lami_Roller_Lower_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 145, '145_Final_Cutting_Up_Dn_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 146, '146_Upper_Pet_Rewinder_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 147, '147_Lower_Pet_Rewinder_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 148, '148_Lami_Roller_Up_Dn_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 149, '149_Upper_Heat1_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 150, '150_Upper_Heat2_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 151, '151_Upper_Heat3_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 152, '152_Upper_Heat4_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 153, '153_Upper_Heat5_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 154, '154_Upper_Heat6_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 155, '155_Upper_Heat7_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 156, '156_Upper_Heat8_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 157, '157_Upper_Heat9_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 158, '158_Lower_Heat1_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 159, '159_Lower_Heat2_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 160, '160_Lower_Heat3_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 161, '161_Lower_Heat4_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 162, '162_Lower_Heat5_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 163, '163_Lower_Heat6_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 164, '164_Lower_Heat7_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 165, '165_Lower_Heat8_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 166, '166_Lower_Heat9_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 167, '167_Lami_Aux_Upper_Heat_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 168, '168_Lami_Aux_Lower_Heat_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 169, '169_Front_Upper_Sepa_Heat_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 170, '170_Back_Upper_Sepa_Heat_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 171, '171_Front_Lower_Sepa_Heat_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 172, '172_Back_Lower_Sepa_Heat_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 173, '173_Heater_Panel_Main_MC_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 174, '174_Heater_Panel_Servo_MC_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 175, '175_Corona_MC_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 176, '176_Ring_Blow1_MC_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 177, '177_Ring_Blow2_MC_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 178, '178_Dust_Collect1_MC_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 179, '179_Dust_Collect2_MC_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 180, '180_MGZ_Panel_Main_NFB_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 181, '181_MGZ_Panel_Inverter_NFB_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 182, '182_Short_Check_Control_Power_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 183, '183_Final_Cutting_Feeding_belt_cp_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 184, '184_Short_Check_Feeding_belt_cp_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 185, '185_Vision_Feeding_belt_cp_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 186, '186_Bicell_Feeding_belt_cp_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 187, '187_OK1_Rotate_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 188, '188_OK2_Rotate_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 189, '189_MGZ1_Recieve_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 190, '190_MGZ1_Lift_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 191, '191_MGZ2_Recieve_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 192, '192_MGZ2_Lift_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 193, '193_Sepa_Sealing_FWD_BWD_Error_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 194, '194_Short_check_FWD_BWD_Error_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 195, '195_Vision_FWD_BWD_Error_Servo_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 196, '196_MGZ_Recieve1_Guide_Roller_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 197, '197_MGZ_Recieve2_Guide_Roller_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 198, '198_MGZ_Conveyor1_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 199, '199_MGZ_Conveyor2_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 200, '200_MGZ_Loading_C_V_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 201, '201_MGZ_ULD_C_V_CP_Off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 202, '202_MGZ_Recieve1_Guide_Roller_alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 203, '203_MGZ_Recieve2_Guide_Roller_alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 204, '204_MGZ_Conveyor1_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 205, '205_MGZ_Conveyor2_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 206, '206_MGZ_ULD_Conveyor_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 207, '207_VISION_PC_CP_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 208, '208_VISION_OUTPUT_DC24V_POWER_CP_OFF', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 209, '209_Final_panel_FFU2_power_NFB_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 210, '210_MGZ_panel_servo_NFB_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 211, '211_MGZ_panel_Linear_servo_MC_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 212, '212_MGZ_panel_servo_MC_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'PD', 215, '215_Dust_Collector1_Flow_Meter_Upper_Limit_Alarm', 'EL014_00_000_PD_품질이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'PD', 216, '216_Dust_Collector1_Flow_Meter_Lower_Limit_Alarm', 'EL014_00_000_PD_품질이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'PD', 217, '217_Dust_Collector2_Flow_Meter_Upper_Limit_Alarm', 'EL014_00_000_PD_품질이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'PD', 218, '218_Dust_Collector2_Flow_Meter_Lower_Limit_Alarm', 'EL014_00_000_PD_품질이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'PD', 219, '219_Ring_Blow1_Flow_meter_Upper_Limit_Alarm', 'EL014_00_000_PD_품질이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'PD', 220, '220_Ring_Blow1_Flow_meter_Lower_Limit_Alarm', 'EL014_00_000_PD_품질이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'PD', 221, '221_Ring_Blow2_Flow_meter_Upper_Limit_Alarm', 'EL014_00_000_PD_품질이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'PD', 222, '222_Ring_Blow2_Flow_meter_Lower_Limit_Alarm', 'EL014_00_000_PD_품질이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 230, '230_Upper_Electrod_Unwinder1_Servo_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 231, '231_Upper_Electrod_Unwinder1_Servo_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 232, '232_Upper_Electrod_Unwinder2_Servo_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 233, '233_Upper_Electrod_Unwinder2_Servo_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 234, '234_Upper_Electrod_Rewinder1_Servo_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 235, '235_Upper_Electrod_Rewinder1_Servo_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 236, '236_Center_Electrod_Unwinder1_Servo_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 237, '237_Center_Electrod_Unwinder1_Servo_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 238, '238_Center_Electrod_Unwinder2_Servo_Alarm', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 239, '239_Center_Electrod_Unwinder2_Servo_off', 'EL012_00_000_BM_3분 이상');
INSERT INTO t_alarm_trouble_info (var_id, var_gr, alarm_cd, trouble_cd, loss_detail_cd) VALUES('Trouble Code', 'BM', 240, '240_Center_Electrod_Rewinder1_Servo_Alarm', 'EL012_00_000_BM_3분 이상');

