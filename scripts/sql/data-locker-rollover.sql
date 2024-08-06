



/*This script utilizes the merge function to track entered IDs and generated IDs, which removes the need
for Excel Index matches. This is script works best to copy a set of Data Locker banks into another District,
but can also be utilized to complete Data Locker Rollover. If you use this for Rollover, it will require
a manual adjustment at the end to clean up names. This is because most districts do not have consistent naming conventions.

I have hopes that this merge --> insert --> output structure can be utilize for any tiered duplication task we have,
where we need to duplicate an existing entry and also duplicate linked entries. Please reach out to Lucas if you have any questions.*/

begin tran
declare
@districtid int,
@ext varchar(255),
@DL varchar,
@publish varchar


---------------->>>>> VARIABLES [EDIT THIS SECTION] <<<<<----------------

set @districtid = 3686 -- Destination DistrictID goes here

declare @OldVTs table (ID int)
INSERT INTO @OldVTs VALUES (3603961),(4186987),(3603959),(3677482),(3693960),(3718679),(3893756),(3994601),(4022704),(4099438),(4163734),(3603971),(4186993),(3603976),(3603975),(4017541)

--SELECT VirtualTestID FROM VirtualTest WHERE BankID IN (SELECT ID FROM @OldBanks)

--This table will store the initial values of our Old Banks
declare @OldBanks table (ID int)
INSERT INTO @OldBanks SELECT DISTINCT BankID FROM VirtualTest with (nolock) WHERE VirtualtestID IN (SELECT ID FROM @OldVTs)
-- Add Bank IDs, seperated by ),( You can use https://www.gillmeister-software.com/online-tools/text/remove-line-breaks.aspx

--[For copy, set to 'N']
set @DL = 'Y'
set @publish = 'Y' -- Keep as Y unless the district does not want their forms republished
/*[FOR DL Rollover, SET TO 'Y'. ***IMPORTANT*** If you are using this for Data Locker rollover, this script will produce the
tables for both the Banks and VirtualTests, indicating the old names and new names. You must update the names of the
new banks and tests, as they will have weird names LIKE '21-2220-21%'. Alternatively, if there are no years on the
old banks and tests, you will need to add 19-20 to them.*/

----------------------------------- DO NOT EDIT BELOW --------------------------------------------

Declare @short3Year Varchar(50) = '20-21', @long3Year Varchar(50) = '2020-21', @Full3Year Varchar(50) = '2020-2021', @current3Year varchar(50) = '20'
Declare @short2Year Varchar(50) = '21-22', @long2Year Varchar(50) = '2021-22', @Full2Year Varchar(50) = '2021-2022', @current2Year varchar(50) = '21'
Declare @short1Year Varchar(50) = '22-23', @long1Year Varchar(50) = '2022-23', @Full1Year Varchar(50) = '2022-2023', @current1Year varchar(50) = '22'
Declare @shortYear Varchar(50)  = '23-24', @longYear Varchar(50) = '2023-24', @FullYear Varchar(50) = '2023-2024', @currentYear varchar(50) = '23'
Declare @shortNewYear Varchar(50) = '24-25', @longNewYear Varchar(50) = '2024-25', @newFullYear Varchar(50) = '2024-2025'

-- This table will store relationships between old Banks and new Banks
DECLARE @MyBankRef TABLE (NewID INT, OldId INT)
/*
INSERT INTO Bank (Name, SubjectID, BankAccessID, CreatedByUserID, CreatedDate,UpdatedDate,Archived)
output inserted.BankID into @OldBanks (NewID)
(SELECT Name, SubjectID, BankAccessID, @UserID, GETDATE(), GETDATE(), Null FROM Bank WHERE BankID IN (SELECT ID FROM @OldBanks))
*/

--This Merge statement will add elements to Bank while allowing us to compare Old IDs to new IDS
MERGE INTO Bank as dest
USING (SELECT * FROM Bank WHERE BankID IN (SELECT ID FROM @OldBanks)) as ins
	ON 1=0 --Always false, so the Merge functions as an Insert

WHEN NOT MATCHED BY TARGET
THEN INSERT (Name, SubjectID, BankAccessID, CreatedByUserID, CreatedDate,UpdatedDate,Archived)
VALUES (CASE 
					when CHARINDEX(@FullYear,ins.Name) > 5 THEN REPLACE(CONCAT(@newFullyear,' ',ins.Name), @FullYear,'')
					when CHARINDEX(@longyear,ins.Name) > 5 THEN REPLACE(CONCAT(@longnewyear,' ',ins.Name), @longyear,'')
					when CHARINDEX(@shortyear,ins.Name) > 5 THEN REPLACE(CONCAT(@shortnewyear,' ',ins.Name),@shortyear,'')
					when CHARINDEX(@Full1Year,ins.Name) > 5 THEN REPLACE(CONCAT(@newFullyear,' ',ins.Name), @Full1Year,'')
					when CHARINDEX(@long1year,ins.Name) > 5 THEN REPLACE(CONCAT(@longnewyear,' ',ins.Name), @long1year,'')
					when CHARINDEX(@short1year,ins.Name) > 5 THEN REPLACE(CONCAT(@shortnewyear,' ',ins.Name),@short1year,'')
					when CHARINDEX(@Full2Year,ins.Name) > 5 THEN REPLACE(CONCAT(@newFullyear,' ',ins.Name), @Full2Year,'')
					when CHARINDEX(@long2year,ins.Name) > 5 THEN REPLACE(CONCAT(@longnewyear,' ',ins.Name), @long2year,'')
					when CHARINDEX(@short2year,ins.Name) > 5 THEN REPLACE(CONCAT(@shortnewyear,' ',ins.Name),@short2year,'')
					when CHARINDEX(@Full3Year,ins.Name) > 5 THEN REPLACE(CONCAT(@newFullyear,' ',ins.Name), @Full3Year,'')
					when CHARINDEX(@long3year,ins.Name) > 5 THEN REPLACE(CONCAT(@longnewyear,' ',ins.Name), @long3year,'')
					when CHARINDEX(@short3year,ins.Name) > 5 THEN REPLACE(CONCAT(@shortnewyear,' ',ins.Name),@short3year,'')
					when CHARINDEX(@FullYear,ins.Name) > 0 THEN REPLACE(ins.Name, @FullYear, @newFullYear)
					when CHARINDEX(@longyear,ins.Name) > 0 THEN REPLACE(ins.Name, @longyear, @longnewyear)
					when CHARINDEX(@shortyear,ins.Name) > 0 THEN REPLACE(ins.Name, @shortYear, @shortnewyear)
					when CHARINDEX(@Full1Year,ins.Name) > 0 THEN REPLACE(ins.Name, @Full1Year, @newFullYear)
					when CHARINDEX(@long1year,ins.Name) > 0 THEN REPLACE(ins.Name, @long1year, @longnewyear)
					when CHARINDEX(@short1year,ins.Name) > 0 THEN REPLACE(ins.Name, @short1Year, @shortnewyear)
					when CHARINDEX(@Full2Year,ins.Name) > 0 THEN REPLACE(ins.Name, @Full2Year, @newFullYear)
					when CHARINDEX(@long2year,ins.Name) > 0 THEN REPLACE(ins.Name, @long2year, @longnewyear)
					when CHARINDEX(@short2year,ins.Name) > 0 THEN REPLACE(ins.Name, @short2Year, @shortnewyear)
					when CHARINDEX(@Full3Year,ins.Name) > 0 THEN REPLACE(ins.Name, @Full3Year, @newFullYear)
					when CHARINDEX(@long3year,ins.Name) > 0 THEN REPLACE(ins.Name, @long3year, @longnewyear)
					when CHARINDEX(@short3year,ins.Name) > 0 THEN REPLACE(ins.Name, @short3Year, @shortnewyear)
					else CONCAT(@shortnewyear,' ',ins.Name)
					END
, ins.SubjectID, ins.BankAccessID, ins.CreatedByUserID, GETDATE(), GETDATE(), Null)
-- This output links the IDs, which we can use for later inserts
OUTPUT inserted.BankID, ins.BankID
INTO @MyBankRef (NewID, OldID);
/*
declare @OldVTs table (ID int)
INSERT INTO @OldVTs SELECT VirtualTestID FROM VirtualTest WHERE BankID IN (SELECT ID FROM @OldBanks)
*/
DECLARE @MyVTRef TABLE (NewID INT, OldId INT)

--Same as banks, but this time we need to join on our Bank Reference table
MERGE INTO VirtualTest as dest
USING 
(SELECT vt.VirtualTestID, vt.Name, vt.StateID, br.NewID as BankID, vt.VirtualTestSourceID, vt.AuthorUserID, vt.Archived, vt.EditedByUserID, vt.AchievementLevelSettingID, vt.VirtualTestType, vt.Instruction, vt.PreQTIVirtualTestID, vt.PreProdVTID, vt.TestScoreMethodID, vt.VIrtualTestSubTypeID, vt.IsTeacherLed,vt.DataSetOriginID,vt.DataSetCategoryID, vt.UsePointsEarnedCOnversion, vt.HasUseRationale, vt.isNumberQuestions, vt.IsMultipleTestResult, vt.NavigationMethodID
FROM VirtualTest vt
JOIN @MyBankRef br ON br.OldID = vt.BankID
WHERE vt.VirtualTestID IN (SELECT ID FROM @OldVTs))
as ins ON 1=0

WHEN NOT MATCHED BY TARGET
THEN Insert (Name, StateID, BankID, VirtualTestSourceID, CreatedDate, UpdatedDate, AuthorUserID, Archived, EditedByUserID, AchievementLevelSettingID, VirtualTestType,Instruction, PreQTIVirtualTestID, PreProdVTID, TestScoreMethodID, VIrtualTestSubTypeID,DataSetOriginID,DataSetCategoryID, IsTeacherLed, UsePointsEarnedCOnversion, HasUseRationale, isNumberQuestions, IsMultipleTestResult, NavigationMethodID)
VALUES (CASE 
					when CHARINDEX(@FullYear,ins.Name) > 5 THEN REPLACE(CONCAT(@newFullyear,' ',ins.Name), @FullYear,'')
					when CHARINDEX(@longyear,ins.Name) > 5 THEN REPLACE(CONCAT(@longnewyear,' ',ins.Name), @longyear,'')
					when CHARINDEX(@shortyear,ins.Name) > 5 THEN REPLACE(CONCAT(@shortnewyear,' ',ins.Name),@shortyear,'')
					when CHARINDEX(@Full1Year,ins.Name) > 5 THEN REPLACE(CONCAT(@newFullyear,' ',ins.Name), @Full1Year,'')
					when CHARINDEX(@long1year,ins.Name) > 5 THEN REPLACE(CONCAT(@longnewyear,' ',ins.Name), @long1year,'')
					when CHARINDEX(@short1year,ins.Name) > 5 THEN REPLACE(CONCAT(@shortnewyear,' ',ins.Name),@short1year,'')
					when CHARINDEX(@Full2Year,ins.Name) > 5 THEN REPLACE(CONCAT(@newFullyear,' ',ins.Name), @Full2Year,'')
					when CHARINDEX(@long2year,ins.Name) > 5 THEN REPLACE(CONCAT(@longnewyear,' ',ins.Name), @long2year,'')
					when CHARINDEX(@short2year,ins.Name) > 5 THEN REPLACE(CONCAT(@shortnewyear,' ',ins.Name),@short2year,'')
					when CHARINDEX(@Full3Year,ins.Name) > 5 THEN REPLACE(CONCAT(@newFullyear,' ',ins.Name), @Full3Year,'')
					when CHARINDEX(@long3year,ins.Name) > 5 THEN REPLACE(CONCAT(@longnewyear,' ',ins.Name), @long3year,'')
					when CHARINDEX(@short3year,ins.Name) > 5 THEN REPLACE(CONCAT(@shortnewyear,' ',ins.Name),@short3year,'')
					when CHARINDEX(@FullYear,ins.Name) > 0 THEN REPLACE(ins.Name, @FullYear, @newFullYear)
					when CHARINDEX(@longyear,ins.Name) > 0 THEN REPLACE(ins.Name, @longyear, @longnewyear)
					when CHARINDEX(@shortyear,ins.Name) > 0 THEN REPLACE(ins.Name, @shortYear, @shortnewyear)
					when CHARINDEX(@Full1Year,ins.Name) > 0 THEN REPLACE(ins.Name, @Full1Year, @newFullYear)
					when CHARINDEX(@long1year,ins.Name) > 0 THEN REPLACE(ins.Name, @long1year, @longnewyear)
					when CHARINDEX(@short1year,ins.Name) > 0 THEN REPLACE(ins.Name, @short1Year, @shortnewyear)
					when CHARINDEX(@Full2Year,ins.Name) > 0 THEN REPLACE(ins.Name, @Full2Year, @newFullYear)
					when CHARINDEX(@long2year,ins.Name) > 0 THEN REPLACE(ins.Name, @long2year, @longnewyear)
					when CHARINDEX(@short2year,ins.Name) > 0 THEN REPLACE(ins.Name, @short2Year, @shortnewyear)
					when CHARINDEX(@Full3Year,ins.Name) > 0 THEN REPLACE(ins.Name, @Full3Year, @newFullYear)
					when CHARINDEX(@long3year,ins.Name) > 0 THEN REPLACE(ins.Name, @long3year, @longnewyear)
					when CHARINDEX(@short3year,ins.Name) > 0 THEN REPLACE(ins.Name, @short3Year, @shortnewyear)
					else CONCAT(@shortnewyear,' ',ins.Name)
					END
, ins.StateID, ins.BankID, ins.VirtualTestSourceID, GETDATE(), GETDATE(), ins.AuthorUserID, ins.Archived, ins.EditedByUserID, ins.AchievementLevelSettingID, ins.VirtualTestType,ins.Instruction, ins.PreQTIVirtualTestID, ins.PreProdVTID, ins.TestScoreMethodID, ins.VIrtualTestSubTypeID,ins.DataSetOriginID,ins.DataSetCategoryID, ins.IsTeacherLed, ins.UsePointsEarnedCOnversion, ins.HasUseRationale, ins.isNumberQuestions, ins.IsMultipleTestResult, ins.NavigationMethodID)

OUTPUT inserted.VirtualTestID, ins.VirtualTestID
INTO @MyVTRef (NewID, OldID);

--We don't need the complicated merge structure because we do not need to save associations for this table
INSERT INTO VirtualTest_VirtualTestCustomScore (VirtualTestID,VirtualTestCustomScoreID)
SELECT ref.NewID, vtvtcs.VirtualTestCustomScoreID FROM VirtualTest_VirtualTestCustomScore vtvtcs
JOIN @MyVTRef ref ON vtvtcs.VirtualTestID = ref.OldId
WHERE vtvtcs.VirtualTestID IN (SELECT OldID FROM @MyVTRef)

declare @OldPBVTs table (ID int)
INSERT INTO @OldPBVTs SELECT PerformanceBandVirtualTestID FROM PerformanceBandVirtualTest
WHERE VirtualTestID IN (SELECT ID FROM @OldVTs)

DECLARE @MyPBVTRef TABLE (NewID INT, OldId INT)

MERGE INTO PerformanceBandVirtualTest as dest
USING (SELECT pbvt.PerformanceBandVirtualTestID, vtr.NewID as VirtualTestID, pbvt.CreatedBy as CreatedBy, GetDate() as CreatedOn, pbvt.Locked, pbvt.Level, @DistrictID as ID, pbvt.UpdatedBy as UpdatedBy, GetDate() as UpdatedOn
FROM PerformanceBandVirtualTest pbvt
JOIN @MyVTRef vtr ON vtr.OldID = pbvt.VirtualTestID
WHERE pbvt.PerformanceBandVirtualTestID IN (SELECT ID FROM @OldPBVTs))
as ins ON 1=0
WHEN NOT MATCHED BY TARGET
THEN Insert (VirtualTestID, CreatedBy, CreatedOn, Locked, Level, ID, UpdatedBy, UpdatedOn)
VALUES (ins.VirtualTestID, ins.CreatedBy, ins.CreatedOn, ins.Locked, ins.Level, ins.ID, ins.UpdatedBy, ins.UpdatedOn)

OUTPUT inserted.PerformanceBandVirtualTestID, ins.PerformanceBandVirtualTestID
INTO @MyPBVTRef (NewID, OldID);

--We don't need the complicated merge structure because we do not need to save associations for this table
INSERT INTO PerformanceBandVirtualTestScoreSetting(PerformanceBandVirtualTestID, CreatedBy, CreatedOn, PerformanceBandGroupID, Cutoffs, ScoreType, Colors, UpdatedBy, UpdatedOn, Label, IsPrincipalLevel)
SELECT ref.NewID, pbvts.CreatedBy, GetDate(), pbvts.PerformanceBandGroupID, pbvts.Cutoffs, pbvts.ScoreType, pbvts.Colors, pbvts.UpdatedBy, GetDate(), pbvts.Label, pbvts.IsPrincipalLevel
FROM PerformanceBandVirtualTestScoreSetting pbvts
JOIN @MyPBVTRef ref ON pbvts.PerformanceBandVirtualTestID = ref.OldId
WHERE pbvts.PerformanceBandVirtualTestID IN (SELECT OldID FROM @MyPBVTRef)

--We don't need the complicated merge structure because we do not need to save associations for this table
INSERT INTO PerformanceBandVirtualTestSubScoreSetting(PerformanceBandVirtualTestID, CreatedBy, CreatedOn, PerformanceBandGroupID, Cutoffs, ScoreType, Colors, UpdatedBy, UpdatedOn, Label, IsPrincipalLevel,SubScoreName)
SELECT ref.NewID, pbvts.CreatedBy, GetDate(), pbvts.PerformanceBandGroupID, pbvts.Cutoffs, pbvts.ScoreType, pbvts.Colors, pbvts.UpdatedBy, GetDate(), pbvts.Label, pbvts.IsPrincipalLevel,pbvts.SubScoreName
FROM PerformanceBandVirtualTestSubScoreSetting pbvts
JOIN @MyPBVTRef ref ON pbvts.PerformanceBandVirtualTestID = ref.OldId
WHERE pbvts.PerformanceBandVirtualTestID IN (SELECT OldID FROM @MyPBVTRef)


SELECT OldID, ob.Name,
NewID, nb.Name
AS 'New Bank IDs' FROM @MyBankRef
JOIN Bank ob ON ob.BankID = OldId
JOIN Bank nb ON nb.BankID = NewId

SELECT OldID, ov.Name,
NewID, nv.Name
AS 'New Virtual Test IDs' FROM @MyVTRef
JOIN VirtualTest ov ON ov.VirtualTestID = OldId
JOIN VirtualTest nv ON nv.VirtualTestID = NewId

--For Rollover: to archive the old banks, query the publish entries, and delete the publish entries.--
if @DL = 'Y'
begin
	if @publish = 'Y'
	begin
		UPDATE BankDistrict
		SET BankID = mbr.NewID
		FROM BankDistrict bd with (nolock)
		JOIN @MyBankRef mbr ON mbr.OldId = bd.BankID

		UPDATE BankSchool
		SET BankID = mbr.NewID
		FROM BankSchool bs with (nolock)
		JOIN @MyBankRef mbr ON mbr.OldId = bs.BankID

		SELECT * FROM BankDistrict
		WHERE DistrictID = @districtid
		AND BankID IN (SELECT OldID FROM @MyBankRef);

		SELECT * FROM BankSchool
		WHERE SchoolID IN (Select SchoolID FROM School with (nolock) WHERE DistrictID = @districtid)
		AND BankID IN (SELECT OldID FROM @MyBankRef);	
	end
	else
	begin
		SELECT * FROM BankDistrict
		WHERE DistrictID = @districtid
		AND BankID IN (SELECT OldID FROM @MyBankRef);

		SELECT * FROM BankSchool
		WHERE SchoolID IN (Select SchoolID FROM School with (nolock) WHERE DistrictID = @districtid)
		AND BankID IN (SELECT OldID FROM @MyBankRef);

		DELETE FROM BankDistrict
		WHERE DistrictID = @districtid
		AND BankID IN (SELECT OldID FROM @MyBankRef);

		DELETE FROM BankSchool
		WHERE SchoolID IN (Select SchoolID FROM School with (nolock) WHERE DistrictID = @districtid)
		AND BankID IN (SELECT OldID FROM @MyBankRef);
	end

	UPDATE Bank
	SET Archived = 1
	WHERE BankID IN (SELECT OldID FROM @MyBankRef);
end

commit tran