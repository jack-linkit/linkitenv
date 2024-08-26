begin tran



declare
@UserID int

set @UserID = 4940734

declare @districtIds table (ID int)
INSERT INTO @districtIds VALUES (6524)

INSERT INTO xpsTERM
OUTPUT INSERTED.*
SELECT LDistrictID,ID + 100,REPLACE(REPLACE(Name, '23-24','24-25'), '2023-24','2024-25'),DATEADD(Year, 1, FIRSTDAY),DATEADD(Year, 1, LASTDAY),YEARID + 1,REPLACE(REPLACE(ABBREVIATION, '23-24','24-25'), '2023-24','2024-25'),NOOFDAYS,SCHOOLID,YEARLYCREDITHRS,TERMSINYEAR,PORTION,CASE WHEN IMPORTMAP = '' THEN '' ELSE IMPORTMAP + 100 END,AUTOBUILDBIN,ISYEARREC,PERIODS_PER_DAY,STERMS,TERMINFO_GUID,CODE,DAYS_PER_CYCLE,ATTENDANCE_CALCULATION_CODE,PSGUID,ORIG_NAME,ORIG_FIRSTDAY,ORIG_LASTDAY,DCID FROM xpsTerm with (nolock)
WHERE LDistrictID IN (SELECT ID FROM @DistrictIDs)
AND Firstday > '2023-06-01' AND LastDay < '2024-08-30'
AND Firstday < '2024-05-30' AND LastDay > '2023-09-10'
AND NOT Name like '%Summer%'
AND NOT NAME LIKE '%TestData%'

INSERT INTO DistrictTerm
OUTPUT INSERTED.*
SELECT REPLACE(REPLACE(Name, '23-24','24-25'), '2023-24','2024-25'),DistrictID, DATEADD(Year, 1, DateStart),DATEADD(Year, 1, DateEnd),Code,@userID,@userID,GETDATE(),GETDATE(),SISID,ModifiedUser,ModifiedBy FROM DistrictTerm with (nolock)
WHERE DistrictID IN (SELECT ID FROM @DistrictIDs)
AND DateStart > '2023-06-01' AND DateEnd < '2024-08-30'
AND DateStart < '2024-05-30' AND DateEnd > '2023-09-10'
AND NOT Name like '%Summer%'
AND Name LIKE '%23-%'
AND NOT NAME LIKE '%TestData%'

SELECT * INTO #OldTerms FROM DistrictTerm with (nolock)
WHERE DistrictID IN (SELECT ID FROM @DistrictIDs)
AND DateStart > '2023-06-01' AND DateEnd < '2024-08-30'
AND DateStart < '2024-05-30' AND DateEnd > '2023-09-10'
AND NOT Name like '%Summer%'
AND NOT Name LIKE '%23-%'
AND NOT NAME LIKE '%TestData%'

INSERT INTO DistrictTerm
OUTPUT INSERTED.*
SELECT Name,DistrictID,DATEADD(Year, 1, DateStart),DATEADD(Year, 1, DateEnd),Code,@userID,@userID,GETDATE(),GETDATE(),SISID,ModifiedUser,ModifiedBy
FROM #OldTerms

UPDATE DistrictTerm SET Name = CONCAT('23-24 ',Name)
WHERE DistrictTermID IN
(SELECT DistrictTermID FROM #OldTerms)


DROP TABLE #OldTerms;

select * from districtterm with (nolock)
where districtid = 6524
order by 1 desc

rollback tran
