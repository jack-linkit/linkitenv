-- find nav IDs
select * from NavigatorReport with (nolock)
where districtid = 4519
and CreatedTime >= DATEADD(DAY,-1, GETUTCDATE()) -- recently published
order by 1 desc

update navigatorreport set status = 'Succeeded'
where NavigatorReportID in (155831,155830,155829,155828)

----------------------------------------------------------

declare @DistrictID int =  4519-- target DistrictID
declare @UserID int = 4940734 -- your UserID


declare @navs table (NavigatorReportID int)
insert into @navs
select navigatorreportid
from NavigatorReport with (nolock)
where NavigatorReportID in (155831,155830,155829,155828)
and districtid = @districtid

IF EXISTS (
    SELECT 1 FROM NavigatorReport
        join @navs nav on NavigatorReport.NavigatorReportID = nav.NavigatorReportID
    where status != 'Succeeded'
)
BEGIN
    RAISERROR('Navigator Status is unsuccessful for one or more provided NavigatorReportIDs', 16, 1);
    RETURN;
END

declare @users table (UserID int)
insert into @users
select UserID from [User] with (nolock)
where districtid = @districtid
and email in ('jreina@gehrhsd.net','ssullivan@gehrhsd.net','mmanning@gehrhsd.net','kslingerland@gehrhsd.net','jrushton@gehrhsd.net','bcallaghan@gehrhsd.net','jreina@geh.nj.k12us.com','solson@gehrhsd.net') -- add Emails

select * from @users usr
    join [User] u on usr.UserID = u.UserID


-- don't modify below

begin tran

insert into NavigatorReportPublish (NavigatorReportID, UserID, IsPublished, PublishFirstTime, PublishTime, PublisherId)
select navs.NavigatorReportID, u.UserID, 1, GETUTCDATE(), GETUTCDATE(), @UserID
from @navs navs 
    cross join @users u 
    full outer join NavigatorReportPublish published on navs.NavigatorReportID = published.NavigatorReportID and u.UserID = published.UserID
where published.NavigatorReportID is NULL

commit tran
