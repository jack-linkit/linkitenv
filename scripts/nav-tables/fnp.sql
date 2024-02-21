-------------- NAVIGATOR TABLES ----------------------
--------------- 3RD PARTY BMS ------------------------
----------------------------------last update 12/02/21

declare @testName varchar(50), @categoryName varchar(50), @beg varchar(50), @mid varchar(50), @end varchar(50),@sqlText1 varchar(3000), @sqlText2 varchar(3000), @sqlText3 varchar(3000)

set @testName = 'F&P' --Name in test name
set @categoryName = 'F&P' --Name of Category
set @beg = 'Fall'
set @mid = 'Winter'
set @end = 'Spring'

--exec (@sqlText2)
---- input the category name that your district uses (likely STAR, i-Ready, NWEA MAP, CDT)

-- DISTRICT -------------------------------------------
set @sqlText1 = 'SELECT dsc.DataSetCategoryName as [Test], g.Name as [Grade], sub.Name as [Subject], convert(date,max(tr.ResultDate)) as [Latest Results], convert(date,max(tr.CreatedDate)) as [Latest Created Date],
sum(case when vt.Name like ''%22-%23%'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @beg + ''' +''%'' then 1 else 0 end) as [22-23 '+ @beg +'],
sum(case when vt.Name like ''%22-%23%'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @mid + ''' +''%'' then 1 else 0 end) as [22-23 '+ @mid +'],
sum(case when vt.Name like ''%22-%23%'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @end + ''' +''%'' then 1 else 0 end) as [22-23 '+ @end +'],
sum(case when vt.Name like ''%23-%24%'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @beg + ''' +''%'' then 1 else 0 end) as [23-24 '+ @beg +'],
sum(case when vt.Name like ''%23-%24%'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @mid + ''' +''%'' then 1 else 0 end) as [23-24 '+ @mid +'],
sum(case when vt.Name like ''%23-%24%'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @end + ''' +''%'' then 1 else 0 end) as [23-24 '+ @end +']
from TestResult tr with (NOLOCK)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = b.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join DataSetCategory dsc with (nolock) on dsc.DataSetCategoryID = vt.DataSetCategoryID
where vt.Name like ''%2[23]-%2[234] %'' + ''' + @testName + ''' + ''%'' and sc.DistrictID = ' + @DistrictID +' and vt.Name not like ''%STAR EL%''
and dsc.DataSetCategoryName = ''' + @categoryName + ''' 
group by dsc.DataSetCategoryName, g.Name, g.[Order], sub.Name
order by g.[Order], sub.Name'
--do not include star EL (comment this out if needed)

--print @sqlText1
Exec (@sqlText1)


-- SCHOOL ---------------------------------------------
set @sqlText2 = 'select dsc.DataSetCategoryName as [Test], sc.Name as [School], g.Name as [Grade], sub.Name as [Subject], convert(date,max(tr.ResultDate)) as [Latest Results], convert(date,max(tr.CreatedDate)) as [Latest Created Date],
sum(case when vt.Name like ''%22-%23%'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @beg + ''' +''%'' then 1 else 0 end) as [22-23 '+ @beg +'],
sum(case when vt.Name like ''%22-%23%'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @mid + ''' +''%'' then 1 else 0 end) as [22-23 '+ @mid +'],
sum(case when vt.Name like ''%22-%23%'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @end + ''' +''%'' then 1 else 0 end) as [22-23 '+ @end +'],
sum(case when vt.Name like ''%23-%24%'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @beg + ''' +''%'' then 1 else 0 end) as [23-24 '+ @beg +'],
sum(case when vt.Name like ''%23-%24%'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @mid + ''' +''%'' then 1 else 0 end) as [23-24 '+ @mid +'],
sum(case when vt.Name like ''%23-%24%'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @end + ''' +''%'' then 1 else 0 end) as [23-24 '+ @end +']
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = TR.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = TR.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join DataSetCategory dsc with (nolock) on dsc.DataSetCategoryID = vt.DataSetCategoryID
where vt.Name like ''%2[23]-%2[234] %'' + ''' + @testName + ''' + ''%'' and sc.DistrictID = ' + @DistrictID +' and vt.Name not like ''%STAR EL%''
and dsc.DataSetCategoryName = ''' + @categoryName + ''' 
and vt.Name not like ''%STAR EL%''
and dsc.DataSetCategoryName = '''+@categoryName+''' 
group by dsc.DataSetCategoryName, sc.Name, g.Name, g.[Order], sub.Name
order by sc.Name, g.[Order], sub.Name'

Exec (@sqlText2)

-- HISTORICAL -----------------------------------------
set @sqlText3 =  'select dsc.DataSetCategoryName as [Test], g.Name as [Grade], sub.Name as [Subject],
sum(case when vt.Name like ''%20-%21 %'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @beg + ''' +''%'' then 1 else 0 end) as [20-21 ' + @beg + '],
sum(case when vt.Name like ''%20-%21 %'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @mid + ''' +''%'' then 1 else 0 end) as [20-21 ' + @mid + '],
sum(case when vt.Name like ''%20-%21 %'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @end + ''' +''%'' then 1 else 0 end) as [20-21 ' + @end + '],
sum(case when vt.Name like ''%21-%22 %'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @beg + ''' +''%'' then 1 else 0 end) as [21-22 ' + @beg + '],
sum(case when vt.Name like ''%21-%22 %'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @mid + ''' +''%'' then 1 else 0 end) as [21-22 ' + @mid + '],
sum(case when vt.Name like ''%21-%22 %'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @end + ''' +''%'' then 1 else 0 end) as [21-22 ' + @end + '],
sum(case when vt.Name like ''%22-%23 %'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @beg + ''' +''%'' then 1 else 0 end) as [22-23 ' + @beg + '],
sum(case when vt.Name like ''%22-%23 %'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @mid + ''' +''%'' then 1 else 0 end) as [22-23 ' + @mid + '],
sum(case when vt.Name like ''%22-%23 %'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @end + ''' +''%'' then 1 else 0 end) as [22-23 ' + @end + '],
sum(case when vt.Name like ''%23-%24 %'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @beg + ''' +''%'' then 1 else 0 end) as [23-24 ' + @beg + '],
sum(case when vt.Name like ''%23-%24 %'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @mid + ''' +''%'' then 1 else 0 end) as [23-24 ' + @mid + '],
sum(case when vt.Name like ''%23-%24 %'' and vt.Name like + ''%'' + ''' + @testName + ''' + ''%'' and vt.Name like  ''%'' + ''' + @end + ''' +''%'' then 1 else 0 end) as [23-24 ' + @end + ']
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = b.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join DataSetCategory dsc with (nolock) on dsc.DataSetCategoryID = vt.DataSetCategoryID
where vt.Name like ''%[12][90123]-%[2][01234] %'' + ''' + @testName + ''' + ''%'' and sc.DistrictID = ' + @DistrictID +
--do not include star EL (comment this out if needed)
' and vt.Name not like ''%STAR EL%''
and dsc.DataSetCategoryName = ''' + @categoryName + '''
group by dsc.DataSetCategoryName, g.Name, g.[Order], sub.Name
order by g.[Order], sub.Name'

--print @sqlText3
exec (@sqlText3)
