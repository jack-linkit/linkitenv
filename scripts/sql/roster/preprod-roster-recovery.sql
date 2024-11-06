select 
    sch.Name as 'School Name',
    sch.Code as 'School Code',
    u.UserName as 'Staff User Name', 
    u.Code as 'Staff User Code', 
    dt.Name as 'District Term Name',
    c.Course as 'Course Name',
    c.Section as 'Section Number',
    c.CourseNumber as 'Course Number',
    s.LastName as 'Student Last Name',
    s.MiddleName as 'Student Middle Name',
    s.FirstName as 'Student First Name',
    s.Code as 'Student Local ID',
    s.AltCode as 'Student State ID'
from districtterm dt with (nolock)
    join class c with (nolock) on c.districttermid = dt.districttermid
    join classuser cu with (nolock) on c.classid = cu.classid
    join [User] u with (nolock) on u.userid = cu.userid
    join classstudent cs with (nolock) on cs.classid = c.classid
    join student s with (nolock) on s.studentid = cs.studentid
    join school sch with (nolock) on c.SchoolID = sch.SchoolID
where dt.DistrictTermID = 125581
and c.ClassTypeID = 1
