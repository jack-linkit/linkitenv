-- find nav IDs
select * from NavigatorReport with (nolock)
where districtid = 5156
and CreatedTime >= DATEADD(DAY,-1, GETUTCDATE()) -- recently published
order by 1 desc

----------------------------------------------------------

declare @DistrictID int = 5156 -- target DistrictID
declare @UserID int = 4940734 -- your UserID


declare @navs table (NavigatorReportID int)
insert into @navs
values (154275),(154274),(154273) -- insert NavigatorReportIDs

declare @users table (UserID int)
insert into @users
select UserID from [User] with (nolock)
where districtid = @districtid
and email in ('ckarabinus@belvideresd.org','jmckinney@belvideresd.org','ccarrubba@belvideresd.org') -- add Emails


-- don't modify below

begin tran

insert into NavigatorReportPublish (NavigatorReportID, UserID, IsPublished, PublishFirstTime, PublishTime, PublisherId)
select navs.NavigatorReportID, u.UserID, 1, GETUTCDATE(), GETUTCDATE(), @UserID
from @navs navs 
    cross join @users u 

rollback tran

