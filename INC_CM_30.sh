source /Data/greenplum_load/gp_binaries/gpload/greenplum_path.sh

psql -h 10.40.0.151 -p 5544 -d fgdwprd -U gpadmin -c "

UPDATE EDWDB.EDW_cashmemos
set ed_date = date('now') - 1
FROM STGDB.STG_cashmemos
WHERE STGDB.STG_CASHMEMOS.TRNNO = EDWDB.EDW_CASHMEMOS.TRNNO
AND STGDB.STG_CASHMEMOS.ACCCENTRENO = EDWDB.EDW_CASHMEMOS.ACCCENTRENO
AND ED_DATE IS NULL;"

