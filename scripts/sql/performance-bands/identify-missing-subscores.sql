/* Step 1: Identify the tests which have a performancebandvirtualtest entry and at least one subscore result but no subscore bands */

-- use step 1 sparingly, time consuming query. Can restart from step 2 with the tests that were fixed removed from the list

declare @dsc int = 202

select distinct vt.* from virtualtest vt with (nolock)
    join performancebandvirtualtest pbvt with (nolock) on vt.VirtualTestID = pbvt.VirtualTestID
    left join PerformanceBandVirtualTestSubScoreSetting pbvtsss with (nolock) on pbvt.PerformanceBandVirtualTestID = pbvtsss.PerformanceBandVirtualTestID
    join testresult tr with (nolock) on vt.virtualtestid = tr.virtualtestid
    join testresultscore trs with (nolock) on tr.testresultid = trs.testresultid
    left join testresultsubscore trss with (nolock) on trs.testresultscoreid = trss.TestResultScoreID
    -- join performancebandgroup pbg with (nolock) on pbvtsss.PerformanceBandGroupID = pbg.PerformanceBandGroupID
where vt.DataSetCategoryID = @dsc
and pbvt.level = 0
and (vt.name like '2022-23%' or vt.name like '2023-24%' or vt.name like '2021-22%')
and pbvtsss.PerformanceBandVirtualTestSubScoreSettingID is NULL
and trss.TestResultSubScoreID is not null
order by vt.VirtualTestID asc


/* Step 2: Identify the districts that have the most of these tests available to fix in the Data Preview Module */

select distinct tr.DistrictID, count(distinct vt.virtualtestid) from virtualtest vt with (nolock)
    join performancebandvirtualtest pbvt with (nolock) on vt.VirtualTestID = pbvt.VirtualTestID
    left join PerformanceBandVirtualTestSubScoreSetting pbvtsss with (nolock) on pbvt.PerformanceBandVirtualTestID = pbvtsss.PerformanceBandVirtualTestID
    join testresult tr with (nolock) on vt.virtualtestid = tr.virtualtestid
    join testresultscore trs with (nolock) on tr.testresultid = trs.testresultid
    left join testresultsubscore trss with (nolock) on trs.testresultscoreid = trss.TestResultScoreID
where vt.DataSetCategoryID = @dsc
and pbvt.level = 0
and vt.VirtualTestID in (2333071) -- insert tests from Step 1 
and pbvtsss.PerformanceBandVirtualTestSubScoreSettingID is NULL
and trss.TestResultSubScoreID is not null
group by tr.DistrictID
order by count(distinct vt.VirtualTestID) desc

/* Step 3: Choose the top district, identify which tests they have that need to be updated */

select * from district with (nolock)
where districtid = 3678

select distinct vt.* from virtualtest vt with (nolock)
    join testresult tr with (nolock) on vt.VirtualTestID = tr.VirtualTestID 
where tr.districtid = 3678
and vt.VirtualTestID in (2333071) -- insert tests from Step 2

/* Step 4: delete entries from these tests and reapply in Data Preview */


/* Repeat until there are no more tests in step 1 */
