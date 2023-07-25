source /Data/greenplum_load/gp_binaries/gpload/greenplum_path.sh

psql -h 10.40.0.151 -p 5544 -d fgdwprd -U gpadmin -c "

INSERT into EDWDB.EDW_CashMemos
( trnno, docno, docdate, usersid, terminalid, endtimestamp, acccentreno,
cmtype, clpno, noofreprints, starttimestamp, roundingfigure, netamt, reprintreason, reprintdate,
reprinttime, updationauthorisedby, vvipcardno, vatinvoiceno, empcode, redemptionamt,
kidscardno, kidsredemptionamt, cancellationdate, cancellationtime, membershipno,
edcbalanceamt, membercardno, memberredemptionamt, memberbalanceamt, serialno,
netamtb4gctopup, greendiscamt, st_date )
SELECT
trnno, docno, docdate, usersid, terminalid, endtimestamp, acccentreno,
cmtype, clpno, noofreprints, starttimestamp, roundingfigure, netamt, reprintreason, reprintdate,
reprinttime, updationauthorisedby, vvipcardno, vatinvoiceno, empcode, redemptionamt,
kidscardno, kidsredemptionamt, cancellationdate, cancellationtime, membershipno,
edcbalanceamt, membercardno, memberredemptionamt, memberbalanceamt, serialno,
netamtb4gctopup, greendiscamt, date('now')
from STGDB.STG_CashMemos;"

