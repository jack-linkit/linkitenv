
declare @banks table (bankid int)
insert into @banks
select BankID from Bank with (nolock)
where BankID in (757156,757157,757158,757159,757160,757161,757162,757193,757219,757220,757221,757222,757223,757225,757226,757227,757228,757229,757230,757231,757232)

declare @tests table (vtid int)
insert into @tests (vtid)
select VirtualTestID from VirtualTest vt with (nolock)
    join @banks bank on vt.BankID = bank.bankid
where name not like '%Form A%'

declare @districtID int = 5529

declare @userID int = 4940734

begin tran

    delete from bankdistrict where districtid = @districtid and bankid in (select bankid from @banks)
    insert into bankdistrict (BankId, DistrictID, StartDate, EndDate, EditedByUserID, BankDistrictAccessID)
    select BankID, @districtID, '2024-07-31', '2025-07-31', 4940734, 1 from @banks b


	-- Restrict test ASSIGN for all roles
    delete from XLITestRestrictionModuleRole
    where PublishedLevelName = 'district'
    and PublishedLevelID = @districtID
    and RestrictedObjectName = 'test'
    and RestrictedObjectID in (select vtid from @tests)
    and XLITestRestrictionModuleID = 2

    -- for teachers
    insert into XLITestRestrictionModuleRole
    select 'district', @districtID, 2, 'test', vtid, 2, getdate(), @userID
    from @tests

    -- for district admins
    insert into XLITestRestrictionModuleRole
    select 'district', @districtID, 2, 'test', vtid, 3, getdate(), @userID
    from @tests

    -- for school admins
    insert into XLITestRestrictionModuleRole
    select 'district', @districtID, 2, 'test', vtid, 8, getdate(), @userID
    from @tests


-- Restrict test PRINT for all roles
    delete from XLITestRestrictionModuleRole
    where PublishedLevelName = 'district'
    and PublishedLevelID = @districtID
    and RestrictedObjectName = 'test'
    and RestrictedObjectID in (select vtid from @tests)
    and XLITestRestrictionModuleID = 1

    -- for teachers
    insert into XLITestRestrictionModuleRole
    select 'district', @districtID, 1, 'test', vtid, 2, getdate(), @userID
    from @tests

    -- for district admins
    insert into XLITestRestrictionModuleRole
    select 'district', @districtID, 1, 'test', vtid, 3, getdate(), @userID
    from @tests

    -- for school admins
    insert into XLITestRestrictionModuleRole
    select 'district', @districtID, 1, 'test', vtid, 8, getdate(), @userID
    from @tests

rollback tran
