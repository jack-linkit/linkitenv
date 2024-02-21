declare @districtID varchar(10) = '3643'
------------------ NAVIGATOR TABLES ------------------
------------------ NJSLS LINKIT BMS ------------------
------------------------------- last update 09/14/2022
------------------------ (by your very own Dan Shapiro
-------------------------------------- aka Danny Shaps
--------------------------------- aka King of the SCs)
-------------- Please enjoy responsibly --------------



declare @bm table(School varchar(100), Grade varchar(5), Subject varchar(50), [Latest Results] date,
[19-20 Form A] int, [19-20 Form B] int, [19-20 Form C] int,
[20-21 Form A] int, [20-21 Form B] int, [20-21 Form C] int,
[21-22 Form A] int, [21-22 Form B] int, [21-22 Form C] int,
[22-23 Form A] int, [22-23 Form B] int, [22-23 Form C] int,
[23-24 Form A] int, [23-24 Form B] int, [23-24 Form C] int)

declare @classbm table(School varchar(100), Grade varchar(5), Subject varchar(50), Teacher varchar(102), Class varchar(200),
[23-24 Form A] int, [23-24 Form B] int, [23-24 Form C] int)

declare @k8banks_2324 table (BankID int) 
declare @k8banks_2223 table (BankID int) 
declare @k8banks_2122 table (BankID int) 
declare @k8banks_2021 table (BankID int)
declare @k8banks_1920 table (BankID int)
declare @k8banks_1819 table (BankID int)

declare @msmathbanks_2324 table (BankID int)
declare @msmathbanks_2223 table (BankID int)
declare @msmathbanks_2122 table (BankID int)
declare @msmathbanks_2021 table (BankID int)
declare @msmathbanks_1920 table (BankID int)
declare @msmathbanks_1819 table (BankID int)

declare @hsmathbanks_2324 table (BankID int)
declare @hsmathbanks_2223 table (BankID int)
declare @hsmathbanks_2122 table (BankID int)
declare @hsmathbanks_2021 table (BankID int)
declare @hsmathbanks_1920 table (BankID int)
declare @hsmathbanks_1819 table (BankID int)

declare @hsengbanks_2324  table (BankID int)
declare @hsengbanks_2223  table (BankID int)
declare @hsengbanks_2122  table (BankID int)
declare @hsengbanks_2021  table (BankID int)
declare @hsengbanks_1920  table (BankID int)
declare @hsengbanks_1819  table (BankID int)

-- INSERTING BANKS -----------------------------------

-------- 2023-2024 ---------------------------------------------------
-- K-8
insert into @k8banks_2324
select BankID from Bank with (nolock)
where BankID in (
  542031,542032,542035,542036,542037,542038,542039,542040,542041, -- TEI  ELA
  542043,542044,542045,542046,542047,542048,542049,542051,542052, -- TEI  MATH
	542266,542267,542268,542269,542270,542271,542272,542273,542274, -- MC   ELA
	542276,542277,542278,542279,542280,542281,542282,542283,542284, -- MC   MATH
	542054,542055,542056,542057,542058,542059,542060,542061,542062, -- SPAN ELA
	542064,542065,542066,542068,542070,542071,542072,542074,542075  -- SPAN MATH
)

-- MS MATH
insert into @msmathbanks_2324
select BankID from Bank with (nolock)
where BankID in (
	542050, -- TEI
	542285, -- MC
	542073  -- SPAN
)

-- HS MATH
insert into @hsmathbanks_2324
select BankID from Bank with (nolock)
where BankID in (
	542053, -- TEI
	542286, -- MC
	542076  -- SPAN
)

-- HS ELA
insert into @hsengbanks_2324
select BankID from Bank with (nolock)
where BankID in (
	542042, -- TEI
	542275, -- MC
	542063  -- SPAN
)
-------- 2022-2023 ---------------------------------------------------
-- K-8
insert into @k8banks_2223
select BankID from Bank with (nolock)
where BankID in (
	386352,386364,386366,386368,386371,386372,386375,386376,386378, -- TEI  ELA
	386382,386384,386386,386388,386391,386393,386395,386397,386399, -- TEI  MATH
	386353,386365,386367,386369,386370,386373,386374,386377,386379, -- MC   ELA
	386383,386385,386387,386389,386392,386394,386396,386398,386400, -- MC   MATH
	387261,387262,387263,387264,387265,387266,387267,387268,387269, -- SPAN ELA
	387280,387279,387278,387277,387276,387275,387274,387273,387272  -- SPAN MATH
)

-- MS MATH
insert into @msmathbanks_2223
select BankID from Bank with (nolock)
where BankID in (
	386401, -- TEI
	386402, -- MC
	410910  -- No SPAN
)

-- HS MATH
insert into @hsmathbanks_2223
select BankID from Bank with (nolock)
where BankID in (
	386404, -- TEI
	386403, -- MC
	387271  -- SPAN
, 414251 -- State 75
)

-- HS ELA
insert into @hsengbanks_2223
select BankID from Bank with (nolock)
where BankID in (
	386380, -- TEI
	386381, -- MC
	387270  -- SPAN
, 411516 -- State 75
)


-------- 2021-2022 ---------------------------------------------------
-- K-8
insert into @k8banks_2122
select BankID from Bank with (nolock)
where BankID in (
	273544,273536,273537,273538,273539,273540,273541,273542,273543, -- TEI  ELA
	273549,273547,273548,273550,273551,273552,273553,273554,273556, -- TEI  MATH
	273648,273636,273638,273639,273640,273641,273643,273644,273645, -- MC   ELA
	273662,273649,273651,273652,273653,273654,273656,273658,273659, -- MC   MATH
	300453,300497,300588,300589,300590,301142,301507,301560,303169, -- SPAN ELA
	300452,300498,300556,300557,300558,300559,301508,301509,301510  -- SPAN MATH
)

-- MS MATH
insert into @msmathbanks_2122
select BankID from Bank with (nolock)
where BankID in (
	273555, -- TEI
	372668  -- MC
	        -- No SPAN
)

-- HS MATH
insert into @hsmathbanks_2122
select BankID from Bank with (nolock)
where BankID in (
	273557, -- TEI
	273661, -- MC
	308708  -- SPAN
)

-- HS ELA
insert into @hsengbanks_2122
select BankID from Bank with (nolock)
where BankID in (
	273546, -- TEI
	273647, -- MC
	308710  -- SPAN
)


-------- 2020-2021 ---------------------------------------------------
-- K-8
insert into @k8banks_2021
select BankID from Bank with (nolock)
where BankID in (
	202872,202873,202874,202875,202876,202877,202878,202879,202880, -- TEI  ELA
	202885,202886,202887,202888,202890,202891,202893,202894,202895, -- TEI  MATH
	202940,202941,202945,202946,202947,202948,202949,202950,202952, -- MC   ELA
	202957,202959,202960,202962,202963,202965,202966,202967,202969, -- MC   MATH
	217474,211405,211406,211407,211408,211409,211410,211411,211412, -- SPAN ELA
	217475,211413,211414,211415,211416,211417,211418,211419,211420  -- SPAN MATH
)

-- MS MATH
insert into @msmathbanks_2021
select BankID from Bank with (nolock)
where BankID in (
	210755, -- TEI
	        -- No MC
	211422  -- SPAN
)

-- HS MATH
insert into @hsmathbanks_2021
select BankID from Bank with (nolock)
where BankID in (
	202889, -- TEI
	202970, -- MC
	211421  -- SPAN
)

-- HS ELA
insert into @hsengbanks_2021
select BankID from Bank with (nolock)
where BankID in (
	202881, -- TEI
	202954  -- MC
	        -- No SPAN
)


-------- 2019-2020 ---------------------------------------------------
-- K-8
insert into @k8banks_1920
select BankID from Bank with (nolock)
where BankID in (
	128490,128481,128482,128483,128484,128485,128486,128487,128488, -- TEI  ELA
	128500,128491,128492,128493,128494,128495,128496,128497,128498, -- TEI  MATH
	128509,128501,128502,128503,128504,128505,128506,128507,128508, -- MC   ELA
	128521,128512,128513,128514,128515,128516,128517,128518,128519, -- MC   MATH
	       154091,148374,148378,148382,148385,148390,148392,148394, -- SPAN ELA  No Gr K
	       154094,148375,148380,148384,148387,148391,148393,148395  -- SPAN MATH No Gr K
)

-- MS MATH
insert into @msmathbanks_1920
select BankID from Bank with (nolock)
where BankID in (
	128510, -- TEI
	        -- No MC
	167698  -- SPAN
)

-- HS MATH
insert into @hsmathbanks_1920
select BankID from Bank with (nolock)
where BankID in (
	128499, -- TEI
	128520, -- MC
	165822  -- SPAN
)

-- HS ELA
insert into @hsengbanks_1920
select BankID from Bank with (nolock)
where BankID in (
	128489, -- TEI
	128511  -- MC
	        -- No SPAN
)


-------- 2018-2019 ---------------------------------------------------
-- K-8
insert into @k8banks_1819
select BankID from Bank with (nolock)
where BankID in (
	75852,75853,75854,75855,75856,75857,75858,75859,75861, -- TEI  ELA
	75863,75864,75865,75866,75867,75868,75869,75870,75871, -- TEI  MATH
	76287,76278,76279,76280,76281,76282,76283,76284,76285, -- MC   ELA
	76297,76288,76289,76290,76291,76292,76293,76294,76295, -- MC   MATH
	            79011,79012,79013,79014,79015,79016,79017, -- SPAN ELA  No Gr K, Gr 1
	      83788,83607,83610,83613,83618,83619,83620,83622  -- SPAN MATH No Gr K
)

-- MS MATH
insert into @msmathbanks_1819
select BankID from Bank with (nolock)
where BankID in (
	76755  -- TEI
	       -- No MC
	       -- No SPAN
)

-- HS MATH
insert into @hsmathbanks_1819
select BankID from Bank with (nolock)
where BankID in (
	75872, -- TEI
	76296  -- MC
	       -- No SPAN
)

-- HS ELA
insert into @hsengbanks_1819
select BankID from Bank with (nolock)
where BankID in (
	75862, -- TEI
	76286  -- MC
	       -- No SPAN
)



-- INSERTING DISTRICT/SCHOOL RESULTS -----------------
-- K-8
insert into @bm select sc.Name, g.Name, sub.Name, max(tr.ResultDate),

sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when (vt.BankID in ([1920].BankID) and vt.Name like '%Form C%') or (vt.BankID in ([2021].BankID) and vt.Name like '%Prior Gr BOY%') then 1 else 0 end),

sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' and vt.Name not like '%Prior Gr BOY%' then 1 else 0 end),

sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @k8banks_2324 [2324] on b.BankID = [2324].BankID
left join @k8banks_2223 [2223] on b.BankID = [2223].BankID
left join @k8banks_2122 [2122] on b.BankID = [2122].BankID
left join @k8banks_2021 [2021] on b.BankID = [2021].BankID
left join @k8banks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid
and (vt.BankID in (select * from @k8banks_2324) 
  or vt.BankID in (select * from @k8banks_2223)
  or vt.BankID in (select * from @k8banks_2122)
  or vt.BankID in (select * from @k8banks_2021)
  or vt.BankID in (select * from @k8banks_1920)
)
group by g.Name, sub.Name, sc.Name

-- MS Alg I
insert into @bm select sc.Name, g.Name, 'Algebra I', max(tr.ResultDate),

sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when (vt.BankID in ([1920].BankID) and vt.Name like '%Form C%') or (vt.BankID in ([2021].BankID) and vt.Name like '%Prior Gr BOY%') then 1 else 0 end),

sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' and vt.Name not like '%Prior Gr BOY%' then 1 else 0 end),

sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on b.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @msmathbanks_2324 [2324] on b.BankID = [2324].BankID
left join @msmathbanks_2223 [2223] on b.BankID = [2223].BankID
left join @msmathbanks_2122 [2122] on b.BankID = [2122].BankID
left join @msmathbanks_2021 [2021] on b.BankID = [2021].BankID
left join @msmathbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Alg I %'
and (vt.BankID in (select * from @msmathbanks_2324)
  or vt.BankID in (select * from @msmathbanks_2223)
  or vt.BankID in (select * from @msmathbanks_2122)
  or vt.BankID in (select * from @msmathbanks_2021)
  or vt.BankID in (select * from @msmathbanks_1920)
)
group by g.Name, sub.Name, sc.Name

-- MS Alg II
insert into @bm select sc.Name, g.Name, 'Algebra II', max(tr.ResultDate),

sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when (vt.BankID in ([1920].BankID) and vt.Name like '%Form C%') or (vt.BankID in ([2021].BankID) and vt.Name like '%Prior Gr BOY%') then 1 else 0 end),

sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' and vt.Name not like '%Prior Gr BOY%' then 1 else 0 end),

sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on b.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @msmathbanks_2324 [2324] on b.BankID = [2324].BankID
left join @msmathbanks_2223 [2223] on b.BankID = [2223].BankID
left join @msmathbanks_2122 [2122] on b.BankID = [2122].BankID
left join @msmathbanks_2021 [2021] on b.BankID = [2021].BankID
left join @msmathbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Alg II %'
and (vt.BankID in (select * from @msmathbanks_2324)
  or vt.BankID in (select * from @msmathbanks_2223)
  or vt.BankID in (select * from @msmathbanks_2122)
  or vt.BankID in (select * from @msmathbanks_2021)
  or vt.BankID in (select * from @msmathbanks_1920)
)
group by g.Name, sub.Name, sc.Name

-- MS Geo 
insert into @bm select sc.Name, g.Name, 'Geometry', max(tr.ResultDate),

sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when (vt.BankID in ([1920].BankID) and vt.Name like '%Form C%') or (vt.BankID in ([2021].BankID) and vt.Name like '%Prior Gr BOY%') then 1 else 0 end),

sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' and vt.Name not like '%Prior Gr BOY%' then 1 else 0 end),

sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on b.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @msmathbanks_2324 [2324] on b.BankID = [2324].BankID
left join @msmathbanks_2223 [2223] on b.BankID = [2223].BankID
left join @msmathbanks_2122 [2122] on b.BankID = [2122].BankID
left join @msmathbanks_2021 [2021] on b.BankID = [2021].BankID
left join @msmathbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Geo%'
and (vt.BankID in (select * from @msmathbanks_2324)
  or vt.BankID in (select * from @msmathbanks_2223)
  or vt.BankID in (select * from @msmathbanks_2122)
  or vt.BankID in (select * from @msmathbanks_2021)
  or vt.BankID in (select * from @msmathbanks_1920)
)
group by g.Name, sub.Name, sc.Name

-- HS Alg I
insert into @bm select sc.Name, g.Name, 'Algebra I', max(tr.ResultDate),

sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when (vt.BankID in ([1920].BankID) and vt.Name like '%Form C%') or (vt.BankID in ([2021].BankID) and vt.Name like '%Prior Gr BOY%') then 1 else 0 end),

sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' and vt.Name not like '%Prior Gr BOY%' then 1 else 0 end),

sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on b.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsmathbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsmathbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsmathbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsmathbanks_2021 [2021] on b.BankID = [2021].BankID
left join @hsmathbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Alg I %'
and (vt.BankID in (select * from @hsmathbanks_2324)
  or vt.BankID in (select * from @hsmathbanks_2223)
  or vt.BankID in (select * from @hsmathbanks_2122)
  or vt.BankID in (select * from @hsmathbanks_2021)
  or vt.BankID in (select * from @hsmathbanks_1920)
)
group by g.Name, sub.Name, sc.Name

-- HS Alg II
insert into @bm select sc.Name, g.Name, 'Algebra II', max(tr.ResultDate),

sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when (vt.BankID in ([1920].BankID) and vt.Name like '%Form C%') or (vt.BankID in ([2021].BankID) and vt.Name like '%Prior Gr BOY%') then 1 else 0 end),

sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' and vt.Name not like '%Prior Gr BOY%' then 1 else 0 end),

sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on b.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsmathbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsmathbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsmathbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsmathbanks_2021 [2021] on b.BankID = [2021].BankID
left join @hsmathbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Alg II %'
and (vt.BankID in (select * from @hsmathbanks_2324)
  or vt.BankID in (select * from @hsmathbanks_2223)
  or vt.BankID in (select * from @hsmathbanks_2122)
  or vt.BankID in (select * from @hsmathbanks_2021)
  or vt.BankID in (select * from @hsmathbanks_1920)
)
group by g.Name, sub.Name, sc.Name

-- HS Geo 
insert into @bm select sc.Name, g.Name, 'Geometry', max(tr.ResultDate),

sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when (vt.BankID in ([1920].BankID) and vt.Name like '%Form C%') or (vt.BankID in ([2021].BankID) and vt.Name like '%Prior Gr BOY%') then 1 else 0 end),

sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' and vt.Name not like '%Prior Gr BOY%' then 1 else 0 end),

sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on b.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsmathbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsmathbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsmathbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsmathbanks_2021 [2021] on b.BankID = [2021].BankID
left join @hsmathbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Geo%'
and (vt.BankID in (select * from @hsmathbanks_2324)
  or vt.BankID in (select * from @hsmathbanks_2223)
  or vt.BankID in (select * from @hsmathbanks_2122)
  or vt.BankID in (select * from @hsmathbanks_2021)
  or vt.BankID in (select * from @hsmathbanks_1920)
)
group by g.Name, sub.Name, sc.Name

-- HS Eng I
insert into @bm select sc.Name, g.Name, 'English I', max(tr.ResultDate),

sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when (vt.BankID in ([1920].BankID) and vt.Name like '%Form C%') or (vt.BankID in ([2021].BankID) and vt.Name like '%Prior Gr BOY%') then 1 else 0 end),

sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' and vt.Name not like '%Prior Gr BOY%' then 1 else 0 end),

sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsengbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsengbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsengbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsengbanks_2021 [2021] on b.BankID = [2021].BankID
left join @hsengbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Eng I %'
and (vt.BankID in (select * from @hsengbanks_2324)
  or vt.BankID in (select * from @hsengbanks_2223)
  or vt.BankID in (select * from @hsengbanks_2122)
  or vt.BankID in (select * from @hsengbanks_2021)
  or vt.BankId in (select * from @hsengbanks_1920)
)
group by g.Name, sub.Name, sc.Name

-- HS Eng II
insert into @bm select sc.Name, g.Name, 'English II', max(tr.ResultDate),

sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when (vt.BankID in ([1920].BankID) and vt.Name like '%Form C%') or (vt.BankID in ([2021].BankID) and vt.Name like '%Prior Gr BOY%') then 1 else 0 end),

sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' and vt.Name not like '%Prior Gr BOY%' then 1 else 0 end),

sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsengbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsengbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsengbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsengbanks_2021 [2021] on b.BankID = [2021].BankID
left join @hsengbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Eng II %'
and (vt.BankID in (select * from @hsengbanks_2324)
  or vt.BankID in (select * from @hsengbanks_2223)
  or vt.BankID in (select * from @hsengbanks_2122)
  or vt.BankID in (select * from @hsengbanks_2021)
  or vt.BankId in (select * from @hsengbanks_1920)
)
group by g.Name, sub.Name, sc.Name

-- HS Eng III
insert into @bm select sc.Name, g.Name, 'English III', max(tr.ResultDate),

sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when (vt.BankID in ([1920].BankID) and vt.Name like '%Form C%') or (vt.BankID in ([2021].BankID) and vt.Name like '%Prior Gr BOY%') then 1 else 0 end),

sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' and vt.Name not like '%Prior Gr BOY%' then 1 else 0 end),

sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),

sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsengbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsengbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsengbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsengbanks_2021 [2021] on b.BankID = [2021].BankID
left join @hsengbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Eng III %'
and (vt.BankID in (select * from @hsengbanks_2324)
  or vt.BankID in (select * from @hsengbanks_2223)
  or vt.BankID in (select * from @hsengbanks_2122)
  or vt.BankID in (select * from @hsengbanks_2021)
  or vt.BankId in (select * from @hsengbanks_1920)
)
group by g.Name, sub.Name, sc.Name


-- INSERTING CLASS -----------------------------------
-- K-8
insert into @classbm
select sc.Name, g.Name, sub.Name, CONCAT('"', u.FullName, '"'), c.Name,
sum(case when vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join Class c with (nolock) on C.ClassID = tr.ClassID
Join [User] u with (nolock) on U.UserID = C.UserID
where sc.DistrictID = @districtid
and vt.BankID in (select * from @k8banks_2324)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- MS Alg I
insert into @classbm
select sc.Name, g.Name, 'Algebra I', CONCAT('"', u.FullName, '"'), c.Name,
sum(case when vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join Class c with (nolock) on C.ClassID = tr.ClassID
Join [User] u with (nolock) on U.UserID = C.UserID
where sc.DistrictID = @districtid and vt.Name like '%Alg I %'
and vt.BankID in (select * from @msmathbanks_2324)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- MS Alg II
insert into @classbm
select sc.Name, g.Name, 'Algebra II', CONCAT('"', u.FullName, '"'), c.Name,
sum(case when vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join Class c with (nolock) on C.ClassID = tr.ClassID
Join [User] u with (nolock) on U.UserID = C.UserID
where sc.DistrictID = @districtid and vt.Name like '%Alg II %'
and vt.BankID in (select * from @msmathbanks_2324)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- MS Geo
insert into @classbm
select sc.Name, g.Name, 'Geometry', CONCAT('"', u.FullName, '"'), c.Name,
sum(case when vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join Class c with (nolock) on C.ClassID = tr.ClassID
Join [User] u with (nolock) on U.UserID = C.UserID
where sc.DistrictID = @districtid and vt.Name like '%Geo%'
and vt.BankID in (select * from @msmathbanks_2324)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- HS Alg I
insert into @classbm
select sc.Name, g.Name, 'Algebra I', CONCAT('"', u.FullName, '"'), c.Name,
sum(case when vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join Class c with (nolock) on C.ClassID = tr.ClassID
Join [User] u with (nolock) on U.UserID = C.UserID
where sc.DistrictID = @districtid and vt.Name like '%Alg I %'
and vt.BankID in (select * from @hsmathbanks_2324)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- HS Alg II
insert into @classbm
select sc.Name, g.Name, 'Algebra II', CONCAT('"', u.FullName, '"'), c.Name,
sum(case when vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join Class c with (nolock) on C.ClassID = tr.ClassID
Join [User] u with (nolock) on U.UserID = C.UserID
where sc.DistrictID = @districtid and vt.Name like '%Alg II %'
and vt.BankID in (select * from @hsmathbanks_2324)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- HS Geo
insert into @classbm
select sc.Name, g.Name, 'Geometry', CONCAT('"', u.FullName, '"'), c.Name,
sum(case when vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join Class c with (nolock) on C.ClassID = tr.ClassID
Join [User] u with (nolock) on U.UserID = C.UserID
where sc.DistrictID = @districtid and vt.Name like '%Geo%'
and vt.BankID in (select * from @hsmathbanks_2324)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- HS Eng I
insert into @classbm
select sc.Name, g.Name, 'English I', CONCAT('"', u.FullName, '"'), c.Name,
sum(case when vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join Class c with (nolock) on C.ClassID = tr.ClassID
Join [User] u with (nolock) on U.UserID = C.UserID
where sc.DistrictID = @districtid and vt.Name like '%Eng I %'
and vt.BankID in (select * from @hsengbanks_2324)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- HS Eng II
insert into @classbm
select sc.Name, g.Name, 'English II', CONCAT('"', u.FullName, '"'), c.Name,
sum(case when vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join Class c with (nolock) on C.ClassID = tr.ClassID
Join [User] u with (nolock) on U.UserID = C.UserID
where sc.DistrictID = @districtid and vt.Name like '%Eng II %'
and vt.BankID in (select * from @hsengbanks_2324)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- HS Eng III
insert into @classbm
select sc.Name, g.Name, 'English III', CONCAT('"', u.FullName, '"'), c.Name,
sum(case when vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
Join Class c with (nolock) on C.ClassID = tr.ClassID
Join [User] u with (nolock) on U.UserID = C.UserID
where sc.DistrictID = @districtid and vt.Name like '%Eng III %'
and vt.BankID in (select * from @hsengbanks_2324)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name


------------------ EXTRACTS --------------------------
-- DISTRICT -------------------------
select Grade, Subject, max([Latest Results]) as [Latest Results],
sum([22-23 Form A]) as [22-23 Form A], sum([22-23 Form B]) as [22-23 Form B], sum([22-23 Form C]) as [22-23 Form C],
sum([23-24 Form A]) as [23-24 Form A], sum([23-24 Form B]) as [23-24 Form B], sum([23-24 Form C]) as [23-24 Form C]
from @bm
where ([22-23 Form A]+[22-23 Form B]+[22-23 Form C]+[23-24 Form A]+[23-24 Form B]+[23-24 Form C])>=0
group by Grade, Subject
order by case when Grade = 'K' then 0
			  when Grade = '6-8' then 9 
			  when Grade = '9-12' then 10
			  else Grade end,
		 Subject

-- SCHOOL ---------------------------
select School, Grade, Subject, max([Latest Results]) as [Latest Results],
sum([22-23 Form A]) as [22-23 Form A], sum([22-23 Form B]) as [22-23 Form B], sum([22-23 Form C]) as [22-23 Form C],
sum([23-24 Form A]) as [23-24 Form A], sum([23-24 Form B]) as [23-24 Form B], sum([23-24 Form C]) as [23-24 Form C]
from @bm
where ([22-23 Form A]+[22-23 Form B]+[22-23 Form C]+[23-24 Form A]+[23-24 Form B]+[23-24 Form C])>=0
group by School, Grade, Subject
order by School,
		 case when Grade = 'K' then 0
			  when Grade = '6-8' then 9 
			  when Grade = '9-12' then 10
			  else Grade end,
		 Subject

-- CLASS ----------------------------
select * from @classbm
order by School,
		 case when Grade = 'K' then 0
			  when Grade = '6-8' then 9 
			  when Grade = '9-12' then 10
			  else Grade end,
		 Subject, Teacher, Class

-- HISTORICAL -----------------------
select Grade, Subject, 
sum([19-20 Form A]) as [19-20 A], sum([19-20 Form B]) as [19-20 B], sum([19-20 Form C]) as [19-20 C],
sum([20-21 Form A]) as [20-21 A], sum([20-21 Form B]) as [20-21 B], sum([20-21 Form C]) as [20-21 C],
sum([21-22 Form A]) as [21-22 A], sum([21-22 Form B]) as [21-22 B], sum([21-22 Form C]) as [21-22 C],
sum([22-23 Form A]) as [22-23 A], sum([22-23 Form B]) as [22-23 B], sum([22-23 Form C]) as [22-23 C],
sum([23-24 Form A]) as [23-24 A], sum([23-24 Form B]) as [23-24 B], sum([23-24 Form C]) as [23-24 C]
from @bm
group by Grade, Subject
order by case when Grade = 'K' then 0
			  when Grade = '6-8' then 9 
			  when Grade = '9-12' then 10
			  else Grade end,
		 Subject
