source /Data/greenplum_load/gp_binaries/gpload/greenplum_path.sh

psql -h 10.40.0.151 -p 5544 -d fgdwprd -U gpadmin -c "

INSERT INTO STGDB.STG_CASHMEMOS
SELECT DISTINCT ON (TRNNO, ACCCENTRENO) STGDB.TMP_CASHMEMOS. *
FROM STGDB.TMP_CASHMEMOS,
STGDB.STG_SAPSITEMAPPING
WHERE STGDB.TMP_CASHMEMOS.ACCCENTRENO = STGDB.STG_SAPSITEMAPPING.ACCCENTRENO;

INSERT INTO EDWDB.EDW_DATA_LOAD_LOG
(Load_Type, Load_Date, Load_Time, Table_Name, Loaded_Recs, Error_Records, User_Name)
SELECT 'I', CURRENT_DATE, TO_CHAR(NOW(), 'HH:MI:SS'), 'CASHMEMOS',
(select cast(count(*) as numeric) from STGDB.STG_CASHMEMOS) AS Loaded_Recs,
(select cast(count(*) as numeric) from ERRDB.ERR_CASHMEMOS) AS Error_Records,
user;"

