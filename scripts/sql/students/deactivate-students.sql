update student set status = 2
where studentid in (
select distinct s.studentid from class c with (nolock)
    join classstudent cs with (nolock)  on c.ClassID = cs.ClassID
    join districtterm dt with (nolock) on c.DistrictTermID = dt.DistrictTermID and dt.dateend > GETDATE()
    right join student s with (nolock) on cs.StudentID = s.studentid
where s.Status = 1
and s.districtid = 3883
and dt.DistrictTermID is null
)
