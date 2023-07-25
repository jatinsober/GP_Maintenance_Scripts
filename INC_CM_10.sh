source /Data/greenplum_load/gp_binaries/gpload/greenplum_path.sh

psql -h 10.40.0.151 -p 5544 -d fgdwprd -U gpadmin -c "
TRUNCATE TABLE STGDB.STG_CashMemos;
TRUNCATE TABLE STGDB.TMP_CashMemos;
TRUNCATE TABLE ERRDB.ERR_CashMemos;"

