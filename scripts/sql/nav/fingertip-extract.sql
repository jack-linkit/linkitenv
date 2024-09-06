
	declare @districtid int	
	set @districtid = '3643'

	---Third Party Data

     select d.name as District, d.districtID as [District ID],
	 case when a.name is null and vt.name like '%attendance%' then 'Attendance'
	      when a.name is null and vt.name like '%Grade%' then 'Grade'
		  else a.name end as [Test Type],
	 sub.name as [Subject],
	 vt.name as [Test],
     left(vt.name, 7) as 'Year',
   (case when vt.name like '%fall%' then 'Fall' 
	 when vt.name like '%Winter%' then 'Winter'
	 when vt.name like '%Spring%' then 'Spring'
	 when vt.name like '%01' then '01'
	 when vt.name like '%02' then '02'
	 when vt.name like '%03' then '03'
	 when vt.name like '%04' then '04'
	 when vt.name like '%Q1%' then 'Q1'
	 when vt.name like '%Q2%' then 'Q2'
	 when vt.name like '%Q3%' then 'Q3'
	 when vt.name like '%Q4%' then 'Q4'
	 when vt.name like '%interim 1%' then 'Interim 1'
	 when vt.name like '%interim 2%' then 'Interim 2'
	 when vt.name like '%interim 3%' then 'Interim 3'
	 when vt.name like '%BOY%' then 'BOY'
	 when vt.name like '%MOY%' then 'MOY'
	 when vt.name like '%EOY%' then 'EOY'
	 when vt.name like '%MP1%' then 'MP1'
	 when vt.name like '%MP2%' then 'MP2'
	 when vt.name like '%MP3%' then 'MP3'
	 when vt.name like '%MP4%' then 'MP4'
	 when vt.name like '%S1 GR%' then 'S1'
	 when vt.name like '%S2 GR%' then 'S2'
	 when vt.name like '%FY GR%' then 'FY'
	 else ' ' end) as [Term],
     gr.name as 'Grade',
	 count(distinct tr.TestResultID) as [Test Results]
      from testresult tr With (nolock)
      join virtualtest vt With (nolock) on vt.VirtualTestID=tr.VirtualTestID
      join bank b With (nolock) on b.BankID=vt.BankID
      join Subject sub With (nolock) on sub.SubjectID=b.SubjectID
      join grade gr With (nolock) on gr.GradeID=sub.GradeID
      join school sch With (nolock) on sch.schoolid=tr.schoolid
      left join AchievementLevelSetting a With (nolock) on
      a.AchievementLevelSettingID=vt.AchievementLevelSettingID
      join district d With (nolock) on d.districtid=sch.districtid
      where d.districtid = @districtid 
	  and vt.virtualtestsourceid=3 and vt.virtualtesttype is null
      --and vt.AchievementLevelSettingID!=210
	  and tr.ResultDate > '2018-09-01'
      group by d.Name, d.districtID, a.name, gr.name,
      left(vt.name, 7), sub.name,vt.name
	  order by left(vt.name, 7)

	  
	  
	  --- Local Assessments

	 select d.name as District, d.districtID as [District ID],
	 COALESCE(a.Name ,'Linkit')as [Test Type],
	 sub.name as [Subject],
	 vt.name as [Test],
    (case
	when dt.DateStart > '2023-04-01' and dt.DateEnd < '2024-10-30' then '2023-2024'
	when dt.DateStart > '2022-04-01' and dt.DateEnd < '2023-10-30' then '2022-2023'
	when dt.DateStart > '2021-04-01' and dt.DateEnd < '2022-10-30' then '2021-2022'
	when dt.DateStart > '2020-04-01' and dt.DateEnd < '2021-10-30' then '2020-2021'
	when dt.DateStart > '2019-04-01' and dt.DateEnd < '2020-10-30' then '2019-2020'
	when dt.DateStart > '2018-04-01' and dt.DateEnd < '2019-10-30' then '2018-2019'
	when dt.DateStart > '2017-04-01' and dt.DateEnd < '2018-10-30' then '2017-2018'
	when dt.DateStart > '2016-04-01' and dt.DateEnd < '2017-10-30' then '2016-2017'
	else '<16-17' end) as 'Year',
    (case when vt.name like '%fall%' then 'Fall' 
	 when vt.name like '%Winter%' then 'Winter'
	 when vt.name like '%Spring%' then 'Spring'
	 when vt.name like '%01' then '01'
	 when vt.name like '%02' then '02'
	 when vt.name like '%03' then '03'
	 when vt.name like '%04' then '04'
	 when vt.name like '%Q1%' then 'Q1'
	 when vt.name like '%Q2%' then 'Q2'
	 when vt.name like '%Q3%' then 'Q3'
	 when vt.name like '%Q4%' then 'Q4'
	 when vt.name like '%interim 1%' then 'Interim 1'
	 when vt.name like '%interim 2%' then 'Interim 2'
	 when vt.name like '%interim 3%' then 'Interim 3'
	 when vt.name like '%BOY%' then 'BOY'
	 when vt.name like '%MOY%' then 'MOY'
	 when vt.name like '%EOY%' then 'EOY'
	 when vt.name like '%MP1%' then 'MP1'
	 when vt.name like '%MP2%' then 'MP2'
	 when vt.name like '%MP3%' then 'MP3'
	 when vt.name like '%MP4%' then 'MP4'
	 when vt.name like '%S1 GR%' then 'S1'
	 when vt.name like '%S2 GR%' then 'S2'
	 when vt.name like '%FY GR%' then 'FY'
	 else ' ' end) as [Term],
     gr.name as 'Grade',
	 count(tr.TestResultID) as [Test Results]
      from TestResult tr with (nolock)
      join VirtualTest vt with (nolock) on vt.VirtualTestID=tr.VirtualTestID
      join bank b With (nolock) on b.bankid=vt.bankid
      join subject sub With (nolock) on sub.subjectid=b.subjectid
      join grade gr With (nolock) on gr.gradeid=sub.gradeid
      join Student s with (nolock) on s.StudentID=tr.StudentID
	  left join AchievementLevelSetting a with (nolock) on a.AchievementLevelSettingID = vt.AchievementLevelSettingID
      join District d with (nolock) on d.DistrictID=s.DistrictID
	  join DistrictTerm dt with (nolock) on dt.DistrictTermID = tr.DistrictTermID
      where d.districtID = @districtid
        and d.DistrictGroupID not in (112,114)
        and (tr.qtionlinetestsessionid is not null
        or tr.bubblesheetid is not null
        or (vt.virtualtestsourceid=1 and vt.virtualtesttype in (1,3)))
		and tr.CreatedDate > '2018-09-01'
      group by d.name, b.name, d.districtID, gr.name,dt.DateStart,dt.DateEnd, vt.name, gr.[order], SUB.name, a.name
      order by d.name, sub.name, gr.[order]

	  --- Data Locker 

	 select d.name as District, d.districtID as [District ID],
	 a.Name as [Test Type],
	 sub.name as [Subject],
	 vt.name as [Test],
    (case
	when dt.DateStart > '2023-04-01' and dt.DateEnd < '2024-10-30' then '2023-2024'
	when dt.DateStart > '2022-04-01' and dt.DateEnd < '2023-10-30' then '2022-2023'
	when dt.DateStart > '2021-04-01' and dt.DateEnd < '2022-10-30' then '2021-2022'
	when dt.DateStart > '2020-04-01' and dt.DateEnd < '2021-10-30' then '2020-2021'
	when dt.DateStart > '2019-04-01' and dt.DateEnd < '2020-10-30' then '2019-2020'
	when dt.DateStart > '2018-04-01' and dt.DateEnd < '2019-10-30' then '2018-2019'
	when dt.DateStart > '2017-04-01' and dt.DateEnd < '2018-10-30' then '2017-2018'
	when dt.DateStart > '2016-04-01' and dt.DateEnd < '2017-10-30' then '2016-2017'
	else '<16-17' end) as 'Year',
    (case when vt.name like '%fall%' then 'Fall' 
	 when vt.name like '%Winter%' then 'Winter'
	 when vt.name like '%Spring%' then 'Spring'
	 when vt.name like '%01' then '01'
	 when vt.name like '%02' then '02'
	 when vt.name like '%03' then '03'
	 when vt.name like '%04' then '04'
	 when vt.name like '%Q1%' then 'Q1'
	 when vt.name like '%Q2%' then 'Q2'
	 when vt.name like '%Q3%' then 'Q3'
	 when vt.name like '%Q4%' then 'Q4'
	 when vt.name like '%interim 1%' then 'Interim 1'
	 when vt.name like '%interim 2%' then 'Interim 2'
	 when vt.name like '%interim 3%' then 'Interim 3'
	 when vt.name like '%BOY%' then 'BOY'
	 when vt.name like '%MOY%' then 'MOY'
	 when vt.name like '%EOY%' then 'EOY'
	 when vt.name like '%MP1%' then 'MP1'
	 when vt.name like '%MP2%' then 'MP2'
	 when vt.name like '%MP3%' then 'MP3'
	 when vt.name like '%MP4%' then 'MP4'
	 when vt.name like '%S1 GR%' then 'S1'
	 when vt.name like '%S2 GR%' then 'S2'
	 when vt.name like '%FY GR%' then 'FY'
	 else ' ' end) as [Term],
     gr.name as 'Grade',
	 count(tr.TestResultID) as [Test Results]
      from TestResult tr
      join VirtualTest vt with (nolock) on vt.VirtualTestID=tr.VirtualTestID
      join bank b With (nolock) on b.bankid=vt.bankid
      join subject sub With (nolock) on sub.subjectid=b.subjectid
      join grade gr With (nolock) on gr.gradeid=sub.gradeid
      join Student s with (nolock) on s.StudentID=tr.StudentID
      join District d with (nolock) on d.DistrictID=s.DistrictID
	  join DistrictTerm dt with (nolock) on dt.DistrictTermID = tr.DistrictTermID 
	  left join AchievementLevelSetting a with (nolock) on a.AchievementLevelSettingID = vt.AchievementLevelSettingID
      where d.districtID = @districtid
      and d.DistrictGroupID not in (112,114)
      and vt.virtualtestsourceid=3 and vt.virtualtesttype in (1,5)
	  and tr.CreatedDate > '2018-09-01'
      group by d.name, b.name, d.districtID, gr.name, vt.name, gr.[order], SUB.name, a.Name, dt.DateStart, dt.DateEnd
      order by d.name, sub.name, gr.[order]
