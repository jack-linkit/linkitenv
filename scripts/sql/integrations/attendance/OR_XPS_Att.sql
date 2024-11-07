declare @districtid int = 6501
declare @yearid int = 34
declare @termid varchar(10) = (select top 1 ID from xpsTERM where ldistrictid = @districtid and yearid = @yearid order by id asc)

-- declare @xpsCC table (LDistrictID int, StudentID varchar(200), TermID varchar(10))

-- step 1 insert xpsSTUDENT, xpsTERM, xpsSCHOOL entries via a view or insert statement
insert into xpsCC (LDistrictID, StudentID, TermID, SCHOOLID)
select distinct @districtid, xpsSTUDENT.ID, @termid, xpsSTUDENT.SCHOOLID
from xpsSTUDENT with (nolock)
	join student with (nolock) on xpsSTUDENT.STUDENT_NUMBER = student.Code
where xpsSTUDENT.LDistrictID = @districtid
and student.[Status] = 1

