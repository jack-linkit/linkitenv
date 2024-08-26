
declare @DistrictID int = 5309

select left(virtualtest.Name, 7) as 'Term', virtualtest.Name as 'Test Name', DataSetCategory.DataSetCategoryName as 'Category', sub.Name as 'Subject', max(testresult.ResultDate) as 'Latest Result Date', count(testresult.testresultid) as '# of results'
from testresult with (nolock)
    join virtualtest with (nolock) on testresult.virtualtestid = virtualtest.virtualtestid
    join DistrictTerm with (nolock) on testresult.districttermid = districtterm.districttermid 
    join datasetcategory with (nolock) on virtualtest.DataSetCategoryID = datasetcategory.DataSetCategoryID
    join student with (nolock) on testresult.studentid = student.StudentID 
    left join bank on virtualtest.bankid = bank.bankid
    left join [subject] sub on bank.subjectid = sub.subjectid
where testresult.districtid = @DistrictID
and datasetcategory.DataSetCategoryID not in (24,46, 69)
group by virtualtest.virtualtestid, virtualtest.Name, datasetcategory.DataSetCategoryName, DistrictTerm.Name, sub.Name



select districtterm.name, virtualtest.name, datasetcategory.DataSetCategoryName
from testresult with (nolock)
    join virtualtest with (nolock) on testresult.virtualtestid = virtualtest.virtualtestid
    join DistrictTerm with (nolock) on testresult.districttermid = districtterm.districttermid 
    join datasetcategory with (nolock) on virtualtest.DataSetCategoryID = datasetcategory.DataSetCategoryID
    join student with (nolock) on testresult.studentid = student.StudentID 
    left join bank on virtualtest.bankid = bank.bankid
    left join [subject] sub on bank.subjectid = sub.subjectid
where testresult.districtid = @districtID
and datasetcategory.DataSetCategoryID in (46)

