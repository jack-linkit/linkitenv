declare @districtID int
set @districtID = 'XXXX'

select p.name 'Program Name', 
	pal.Name 'Visible To', 
	sum(case when s.Status = '1' then 1 else 0 end) 'Number of Students'
	from Program p with (nolock)
	join ProgramAccessLevel pal with (nolock)
		on pal.ProgramAccessLevelID = p.AccessLevelID
	left join StudentProgram sp with (nolock)
		on sp.ProgramID = p.ProgramID
	left join student s with (nolock)
		on s.StudentID = sp.StudentID
	where p.DistrictID = @districtID
	group by p.name, pal.name, p.Code
	HAVING sum(case when s.Status = '1' then 1 else 0 end) > 0
	order by p.name

--RoleIDs: 3=DistrictAdmin, 8=SchoolAdmin
select distinct 
--u.UserID, u.RoleID, s.SchoolID, --uncomment for making changes
u.FullName as Name,
u.Email, --hide for SSO
--case when u.UserStatusID=1 then 'Active' else 'Inactive' end as [Status],
r.Display as [Role],
case when u.RoleID=3 then 'n/a' else s.Name end as [School],
'' as [Notes/Changes]
from [User] u with (nolock)
join Role r with (nolock) on u.RoleID = r.RoleID
left join UserSchool us with (nolock) on u.UserID = us.UserID
left join School s with (nolock) on us.SchoolID = s.SchoolID
where u.RoleID in (3,8) and u.UserStatusID = 1 and u.DistrictID=@districtID and UserName not like '%demoadmin%'
--and s.SchoolID not in (139190,135229,135227,135223)
order by [Role], [Name], [School]

select school.name 'School',
class.name 'Class Name', 
districtterm.name 'Term Name',
[user].namelast 'Teacher Last Name', 
[user].namefirst 'Teacher First Name',
[user].username 'Username', 
case when classuser.ClassUserLOEID = 1 then 'Primary' else 'Secondary' end 'Level of Engagement'
from class with (nolock)
inner join classuser with (nolock) on classuser.ClassID = class.classid
inner join school with (nolock) on school.schoolid = class.schoolid
inner join [user] with (nolock) on [user].userid = classuser.userid
inner join districtterm with (nolock) on districtterm.DistrictTermID = class.DistrictTermID
where classuser.classid in (
select class.classid
from class with (nolock)
inner join classuser with (nolock) on classuser.ClassID = class.classid
inner join districtterm with (nolock) on districtterm.DistrictTermID = class.DistrictTermID
where districtterm.dateend > '8-30-2024'
and districtterm.DistrictID = @districtID
group by class.classid, class.name
having count (classuser.userid) > 1)
order by school.name,  class.name, districtterm.name, classuser.ClassUserLOEID, [user].namelast, [user].namefirst
