source /Data/greenplum_load/gp_binaries/gpload/greenplum_path.sh

psql -h 10.40.0.151 -p 5544 -d fgdwprd -U gpadmin -c "
SET DATESTYLE TO ISO,DMY;

INSERT INTO STGDB.TMP_CASHMEMOS
(acccentreno,trnno, docno, docdate, terminalid, usersid, clpno, endtimestamp, cmtype,
starttimestamp, netamt, noofreprints, reprintdate, reprintreason, reprinttime, roundingfigure,
updationauthorisedby, vvipcardno, membershipno, cancellationdate, cancellationtime,
vatinvoiceno, empcode, redemptionamt, kidscardno, kidsredemptionamt, membercardno,
edcbalanceamt, memberredemptionamt, memberbalanceamt, serialno, netamtb4gctopup,
greendiscamt)
SELECT
COALESCE(acccentreno, -9), COALESCE(trnno, -9), docno, docdate, terminalid, usersid, clpno, endtimestamp, cmtype,
starttimestamp, netamt, noofreprints, reprintdate, reprintreason, reprinttime, roundingfigure,
updationauthorisedby, vvipcardno, membershipno, cancellationdate, cancellationtime,
vatinvoiceno, empcode, redemptionamt, kidscardno, kidsredemptionamt, membercardno,
edcbalanceamt, memberredemptionamt, memberbalanceamt, serialno, netamtb4gctopup,
greendiscamt
FROM EXTDB.EXT_CASHMEMOS;

INSERT INTO EDWDB.EDW_DATA_LOAD_LOG
(Load_Type, Load_Date, Load_Time, Table_Name, Loaded_Recs, Error_Records, User_Name)
SELECT 'I', CURRENT_DATE, TO_CHAR(NOW(), 'HH:MI:SS'), 'CASHMEMOS - TMP',
(select cast(count(*) as numeric) from STGDB.TMP_CASHMEMOS) AS Loaded_Recs,
(select cast(count(*) as numeric) from ERRDB.ERR_CASHMEMOS) AS Error_Records,
user;"

