declare @banks table (bankid int)
insert into @banks
select BankID from Bank with (nolock)
where BankID in (644063,644064,644065,644066,644068,644069,644070,644071,644072,644073,644079,644080,644081,644082,644083,644084,644085,644086,644088,646350,646348,644076,644074,644075,644077)

declare @tests table (vtid int)
insert into @tests (vtid)
select VirtualTestID from VirtualTest vt with (nolock)
    join @banks bank on vt.BankID = bank.bankid
where name not like '%Form A%'

declare @districtID int = 6501

declare @userID int = 4940734

begin tran

    insert into bankdistrict (BankId, DistrictID, StartDate, EndDate, EditedByUserID, BankDistrictAccessID)
    select BankID, @districtID, '2023-07-31', '2024-07-31', 4940734, 1 from @banks b


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

select * from XLITestRestrictionModuleRole xli with (nolock)
    join @tests vt on xli.RestrictedObjectID = vt.vtid
where xli.PublishedLevelID = 6501
