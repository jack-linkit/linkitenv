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
    s.FirstName as 'Student First Name',
    s.MiddleName as 'Student Middle Name',
    s.Code as 'Student Local ID',
    s.AltCode as 'Student State ID',
    gen.Name as 'Student Gender',
    '' as 'Student Race',
    g.Name as 'Student Grade'
from student s with (nolock)
    join classstudent cs with (nolock) on s.studentid = cs.studentid
    join class c with (nolock) on cs.classid = c.classid
    join school sch with (nolock) on c.SchoolID = sch.SchoolID
    join classuser cu with (nolock) on c.ClassID = cu.ClassID
    join [User] u with (nolock) on u.userid = cu.UserID
    join DistrictTerm dt with (nolock) on c.DistrictTermID = dt.DistrictTermID
    join Grade g with (nolock) on s.CurrentGradeID = g.GradeID
    join gender gen with (nolock) on s.GenderID = gen.GenderID
where c.districtid = 3150
and dt.districttermid in ()
