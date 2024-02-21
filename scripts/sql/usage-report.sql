declare @districtid INT = 4760 -- set district ID


-- no further modifications needed after here --


declare @2020Usage table (UserID INT, NameLast VARCHAR(50),  NameFirst VARCHAR(50), UserName VARCHAR(100), Code VARCHAR(100), [Role] VARCHAR(50), n_logins INT, LastLoginDate DATE, Schools NVARCHAR(MAX))

;with x as (select u.UserID,u.NameLast,u.NameFirst,u.UserName,u.Code,r.Display as [Role],count(asp.UserID) as [# of LogIns],u.LastLoginDate, sc.[Name] as [School]
from ASPSessionHistorical asp with (nolock) 
join [User] u with (nolock) on u.UserID = asp.UserID and u.DistrictID = @districtid
join [Role] r with (nolock) on r.RoleID = u.RoleID and r.Display != 'student'
left join UserSchool us with (nolock) on us.UserID = u.UserID
left join school sc with (nolock) on sc.schoolid = us.schoolid and sc.districtid = @districtid
left join [AdminReportingLog].dbo.IMPERSONATELOG imp with (NOLOCK) on imp.ImpersonatedUserId = asp.UserID and left(imp.ActionTime, 19) = left(cast(dateadd(DAY, -1, asp.Expired) as datetime),19)
where asp.Expired >= '2020-07-01' and asp.Expired <= '2021-06-30' and imp.ImpersonateLogID is NULL
group by u.UserID,u.NameLast,u.NameFirst,u.UserName,u.Code,r.Display,u.LastLoginDate ,sc.[Name])

insert into @2020Usage (UserID, NameLast, NameFirst, UserName, Code, [Role], n_logins, LastLoginDate, Schools)
select x.UserID,x.NameLast,x.NameFirst,x.UserName,x.Code,x.[Role],x.[# of LogIns],x.LastLoginDate,STRING_AGG(ISNULL(x.school,''),',') WITHIN GROUP (ORDER BY x.school) as [Schools] from x
group by x.UserID,x.NameLast,x.NameFirst,x.UserName,x.Code,x.[Role],x.[# of LogIns],x.LastLoginDate
order by x.[# of LogIns] desc

declare @2021Usage table (UserID INT, NameLast VARCHAR(50),  NameFirst VARCHAR(50), UserName VARCHAR(100), Code VARCHAR(100), [Role] VARCHAR(50), n_logins INT, LastLoginDate DATE, Schools NVARCHAR(MAX))

;with x as (select u.UserID,u.NameLast,u.NameFirst,u.UserName,u.Code,r.Display as [Role],count(asp.UserID) as [# of LogIns],u.LastLoginDate, sc.[Name] as [School]
from ASPSessionHistorical asp with (nolock) 
join [User] u with (nolock) on u.UserID = asp.UserID and u.DistrictID = @districtid
join [Role] r with (nolock) on r.RoleID = u.RoleID and r.Display != 'student'
left join UserSchool us with (nolock) on us.UserID = u.UserID
left join school sc with (nolock) on sc.schoolid = us.schoolid and sc.districtid = @districtid
left join [AdminReportingLog].dbo.IMPERSONATELOG imp with (NOLOCK) on imp.ImpersonatedUserId = asp.UserID and left(imp.ActionTime, 19) = left(cast(dateadd(DAY, -1, asp.Expired) as datetime),19)
where asp.Expired >= '2021-07-01' and asp.Expired <= '2022-06-30' and imp.ImpersonateLogID is NULL
group by u.UserID,u.NameLast,u.NameFirst,u.UserName,u.Code,r.Display,u.LastLoginDate ,sc.[Name])

insert into @2021Usage (UserID, NameLast, NameFirst, UserName, Code, [Role], n_logins, LastLoginDate, Schools)
select x.UserID,x.NameLast,x.NameFirst,x.UserName,x.Code,x.[Role],x.[# of LogIns],x.LastLoginDate,STRING_AGG(ISNULL(x.school,''),',') WITHIN GROUP (ORDER BY x.school) as [Schools] from x
group by x.UserID,x.NameLast,x.NameFirst,x.UserName,x.Code,x.[Role],x.[# of LogIns],x.LastLoginDate
order by x.[# of LogIns] desc

declare @2022Usage table (UserID INT, NameLast VARCHAR(50),  NameFirst VARCHAR(50), UserName VARCHAR(100), Code VARCHAR(100), [Role] VARCHAR(50), n_logins INT, LastLoginDate DATE, Schools NVARCHAR(MAX))

;with x as (select u.UserID,u.NameLast,u.NameFirst,u.UserName,u.Code,r.Display as [Role],count(asp.UserID) as [# of LogIns],u.LastLoginDate, sc.[Name] as [School]
from ASPSessionHistorical asp with (nolock) 
join [User] u with (nolock) on u.UserID = asp.UserID and u.DistrictID = @districtid
join [Role] r with (nolock) on r.RoleID = u.RoleID and r.Display != 'student'
left join UserSchool us with (nolock) on us.UserID = u.UserID
left join school sc with (nolock) on sc.schoolid = us.schoolid and sc.districtid = @districtid
left join [AdminReportingLog].dbo.IMPERSONATELOG imp with (NOLOCK) on imp.ImpersonatedUserId = asp.UserID and left(imp.ActionTime, 19) = left(cast(dateadd(DAY, -1, asp.Expired) as datetime),19)
where asp.Expired >= '2022-07-01' and asp.Expired <= '2023-06-30' and imp.ImpersonateLogID is NULL
group by u.UserID,u.NameLast,u.NameFirst,u.UserName,u.Code,r.Display,u.LastLoginDate ,sc.[Name])

insert into @2022Usage (UserID, NameLast, NameFirst, UserName, Code, [Role], n_logins, LastLoginDate, Schools)
select x.UserID,x.NameLast,x.NameFirst,x.UserName,x.Code,x.[Role],x.[# of LogIns],x.LastLoginDate,STRING_AGG(ISNULL(x.school,''),',') WITHIN GROUP (ORDER BY x.school) as [Schools] from x
group by x.UserID,x.NameLast,x.NameFirst,x.UserName,x.Code,x.[Role],x.[# of LogIns],x.LastLoginDate
order by x.[# of LogIns] desc


declare @2023Usage table (UserID INT, NameLast VARCHAR(50),  NameFirst VARCHAR(50), UserName VARCHAR(100), Code VARCHAR(100), [Role] VARCHAR(50), n_logins INT, LastLoginDate DATE, Schools NVARCHAR(MAX))

;with x as (select u.UserID,u.NameLast,u.NameFirst,u.UserName,u.Code,r.Display as [Role],count(asp.UserID) as [# of LogIns],u.LastLoginDate, sc.[Name] as [School]
from ASPSessionHistorical asp with (nolock) 
join [User] u with (nolock) on u.UserID = asp.UserID and u.DistrictID = @districtid
join [Role] r with (nolock) on r.RoleID = u.RoleID and r.Display != 'student'
left join UserSchool us with (nolock) on us.UserID = u.UserID
left join school sc with (nolock) on sc.schoolid = us.schoolid and sc.districtid = @districtid
left join [AdminReportingLog].dbo.IMPERSONATELOG imp with (NOLOCK) on imp.ImpersonatedUserId = asp.UserID and left(imp.ActionTime, 19) = left(cast(dateadd(DAY, -1, asp.Expired) as datetime),19)
where asp.Expired >= '2023-07-01' and imp.ImpersonateLogID is NULL
group by u.UserID,u.NameLast,u.NameFirst,u.UserName,u.Code,r.Display,u.LastLoginDate ,sc.[Name])

insert into @2023Usage (UserID, NameLast, NameFirst, UserName, Code, [Role], n_logins, LastLoginDate, Schools)
select x.UserID,x.NameLast,x.NameFirst,x.UserName,x.Code,x.[Role],x.[# of LogIns],x.LastLoginDate,STRING_AGG(ISNULL(x.school,''),',') WITHIN GROUP (ORDER BY x.school) as [Schools] from x
group by x.UserID,x.NameLast,x.NameFirst,x.UserName,x.Code,x.[Role],x.[# of LogIns],x.LastLoginDate
order by x.[# of LogIns] desc


SELECT usage.UserID, usage.NameLast, usage.NameFirst, usage.UserName, usage.Code, usage.[Role], COALESCE(zero.n_logins, 0) AS '2020 logins', COALESCE(one.n_logins, 0) AS '2021 logins', COALESCE(two.n_logins, 0) AS '2022 logins', COALESCE(usage.n_logins, 0) AS '2023 logins' ,usage.Schools 
FROM @2023Usage usage
    LEFT JOIN @2022Usage two ON usage.UserID = two.UserID 
    LEFT JOIN @2021Usage one ON usage.UserID = one.UserID 
    LEFT JOIN @2020Usage zero ON usage.UserID = zero.UserID
