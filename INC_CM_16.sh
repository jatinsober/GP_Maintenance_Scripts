source /Data/greenplum_load/gp_binaries/gpload/greenplum_path.sh

psql -h 10.40.0.151 -p 5544 -d fgdwprd -U gpadmin -c "
TRUNCATE TABLE ERRDB.ERR_CashMemos;"
