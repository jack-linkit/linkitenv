-------------- NAVIGATOR TABLES ----------------------
----------- PA CORE & KEYSTONE LINKIT BMS ------------
----------------------------------last update 09/10/24

declare @districtid int
set @districtid = 3686

declare @bm table(School varchar(100), Grade varchar(5), Subject varchar(50), [Latest Results] date,
[19-20 Form A] int, [19-20 Form B] int, [19-20 Form C] int,
[20-21 Form A] int, [20-21 Form B] int, [20-21 Form C] int,
[21-22 Form A] int, [21-22 Form B] int, [21-22 Form C] int,
[22-23 Form A] int, [22-23 Form B] int, [22-23 Form C] int,
[23-24 Form A] int, [23-24 Form B] int, [23-24 Form C] int,
[24-25 Form A] int, [24-25 Form B] int, [24-25 Form C] int
)
declare @classbm table(School varchar(100), Grade varchar(5), Subject varchar(50), Teacher varchar(102), Class varchar(200),
[24-25 Form A] int, [24-25 Form B] int, [24-25 Form C] int)

declare @k8banks_2425 table (BankID int) 
declare @k8banks_2324 table (BankID int) 
declare @k8banks_2223 table (BankID int) 
declare @k8banks_2122 table (BankID int) 
declare @k8banks_2021 table (BankID int)
declare @k8banks_1920 table (BankID int)
declare @k8banks_1819 table (BankID int)

declare @msmathbanks_2425 table (BankID int)
declare @msmathbanks_2324 table (BankID int)
declare @msmathbanks_2223 table (BankID int)
declare @msmathbanks_2122 table (BankID int)
declare @msmathbanks_2021 table (BankID int)
declare @msmathbanks_1920 table (BankID int)
declare @msmathbanks_1819 table (BankID int)

declare @hsmathbanks_2425 table (BankID int)
declare @hsmathbanks_2324 table (BankID int)
declare @hsmathbanks_2223 table (BankID int)
declare @hsmathbanks_2122 table (BankID int)
declare @hsmathbanks_2021 table (BankID int)
declare @hsmathbanks_1920 table (BankID int)
declare @hsmathbanks_1819 table (BankID int)

declare @hsengbanks_2425  table (BankID int)
declare @hsengbanks_2324  table (BankID int)
declare @hsengbanks_2223  table (BankID int)
declare @hsengbanks_2122  table (BankID int)
declare @hsengbanks_2021  table (BankID int)
declare @hsengbanks_1920  table (BankID int)
declare @hsengbanks_1819  table (BankID int)

declare @hslitbanks_2425  table (BankID int)
declare @hslitbanks_2324  table (BankID int)
declare @hslitbanks_2223  table (BankID int)
declare @hslitbanks_2122  table (BankID int)
declare @hslitbanks_2021  table (BankID int)
declare @hslitbanks_1920  table (BankID int)
declare @hslitbanks_1819  table (BankID int)

declare @hsbiobanks_2425  table (BankID int)
declare @hsbiobanks_2324  table (BankID int)
declare @hsbiobanks_2223  table (BankID int)
declare @hsbiobanks_2122  table (BankID int)
declare @hsbiobanks_2021  table (BankID int)
declare @hsbiobanks_1920  table (BankID int)
declare @hsbiobanks_1819  table (BankID int)

-- INSERTING BANKS -----------------------------------
-- 24-25 K-8
insert into @k8banks_2425 values (749604),(749605),(749606),(749612),(749613),(749614),(749615),(759525),(749617),(749731),(749732),(749733),(749734),(749735),(749740),(749741),(749742),(749743),(749744),(749745), (757249),(757250),(757251),(757252),(757253),(757254),(757255),(757256),(757257),(757258),(757259),(757239),(757240),(757241),(757242),(757243),(757244),(757245),(757246),(757247)

-- 23-24 K-8
insert into @k8banks_2324 values (542294),(542295),(542296),(542297),(542298),(542299),(542300),(542301),(542302),(542304),(542305),(542306),(542307),(542308),(542309),(542310),(542312),(542313),(542288),(542289)

-- 22-23 K-8 TEI
insert into @k8banks_2223 values (387224),(387225),(387226),(387227),(387229),(387231),(387234),(387236),(387238),(387242),(387243),(387244),(387245),(387250),(387252),(387254),(387256),(387258),(389968),(389967)

-- 21-22 K-8 TEI
insert into @k8banks_2122 values (273616),(273607),(273608),(273609),(273610),(273611),(273612),(273613),(273614),(273626),(273617),(273618),
								 (273619),(273620),(273621),(273622),(273624),(273625),(273631),(273632)
-- 20-21 K-8 TEI
insert into @k8banks_2021 values (202911),(202925),(202912),(202927),(202914),(202930),(202915),(202931),(202916),(202932),(206009),(202917),
								 (202934),(202919),(202935),(202920),(202936),(202921),(202937),(206008)
-- 19-20 K-8
insert into @k8banks_1920 values (128542),(128534),(128535),(128536),(128537),(128538),(128539),(128540),(128541),(128533),(128525),(128526),
								 (128527),(128528),(128529),(128530),(128531),(128532),(128543),(128544)
-- 18-19
insert into @k8banks_1819 values (74605),(74606),(74607),(74608),(74609),(74610),(74611),(74612),(74613),(74614),(74615),(74616),(74617),
								 (74618),(74619),(74620),(74621),(74622),(74626),(74627)

-- 24-25 Keystone MS Alg
insert into @msmathbanks_2425 values (749749), (757263)
-- 23-24 Keystone MS Alg
insert into @msmathbanks_2324 values (542293)
-- 22-23 Keystone MS Alg 
insert into @msmathbanks_2223 values (389971)
-- 21-22 Keystone MS Alg 
insert into @msmathbanks_2122 values (287837)
-- 20-21 Keystone MS Alg 
insert into @msmathbanks_2021 values (214474)
-- 19-20 Keystone MS Alg
insert into @msmathbanks_1920 values (128634)

-- 24-25 Keystone HS Alg
insert into @hsmathbanks_2425 values (749748), (757262)
-- 23-24 Keystone HS Alg
insert into @hsmathbanks_2324 values (542292)
-- 22-23 Keystone HS Alg 
insert into @hsmathbanks_2223 values (389970)
-- 21-22 Keystone HS Alg 
insert into @hsmathbanks_2122 values (273629)
-- 20-21 Keystone HS Alg 
insert into @hsmathbanks_2021 values (206010)
-- 19-20 Keystone HS Alg
insert into @hsmathbanks_1920 values (128633)

-- 24-25 Keystone HS Lit
insert into @hslitbanks_2425 values (749747),  (757261)
-- 23-24 Keystone HS Lit
insert into @hslitbanks_2324 values (542291)
-- 22-23 Keystone HS Lit 
insert into @hslitbanks_2223 values (389969)
-- 21-22 Keystone HS Lit 
insert into @hslitbanks_2122 values (273627)
-- 20-21 Keystone HS Lit 
insert into @hslitbanks_2021 values (206012)
-- 19-20 Keystone HS Lit
insert into @hslitbanks_1920 values (128635)

-- 24-25 HS Eng (non-Keystone)
insert into @hsengbanks_2425 values (749618), (757248)
-- 23-24 HS Eng (non-Keystone)
insert into @hsengbanks_2324 values (542303)
-- 22-23 HS Eng (non-Keystone)
insert into @hsengbanks_2223 values (387240)
-- 21-22 HS Eng (non-Keystone)
insert into @hsengbanks_2122 values (273615)
-- 20-21 HS Eng (non-Keystone)
insert into @hsengbanks_2021 values (202922)

-- 24-25 Keystone HS Bio
insert into @hsbiobanks_2425 values (749746), (757260)
-- 23-24 Keystone HS Bio
insert into @hsbiobanks_2324 values (542290)
-- 22-23 Keystone HS Bio 
insert into @hsbiobanks_2223 values (389966)
-- 21-22 Keystone HS Bio 
insert into @hsbiobanks_2122 values (273628)
-- 20-21 Keystone HS Bio 
insert into @hsbiobanks_2021 values (206011)
-- 19-20 Keystone HS Bio
insert into @hsbiobanks_1920 values (128636)

-- INSERTING DISTRICT/SCHOOL RESULTS -----------------
-- K-8
insert into @bm select sc.Name, g.Name, sub.Name, max(tr.ResultDate),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @k8banks_2425 [2425] on b.BankID = [2425].BankID
left join @k8banks_2324 [2324] on b.BankID = [2324].BankID
left join @k8banks_2223 [2223] on b.BankID = [2223].BankID
left join @k8banks_2122 [2122] on b.BankID = [2122].BankID
left join @k8banks_2021 [2021] on b.BankID = [2021].BankID
left join @k8banks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name not like '%Prior Gr%' and g.GradeID not in (52,33) --exclude Gr 6-8, 9-12
and (vt.BankID in (select * from @k8banks_2425) 
or vt.BankID in (select * from @k8banks_2324) 
or vt.BankID in (select * from @k8banks_2223) 
or vt.BankID in (select * from @k8banks_2122) 
or vt.BankID in (select * from @k8banks_2021) 
or vt.BankID in (select * from @k8banks_1920))
group by g.Name, sub.Name, sc.Name

-- Keystone MS Alg I
insert into @bm select sc.Name, g.Name, 'Keystone Algebra I', max(tr.ResultDate),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on b.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @msmathbanks_2425 [2425] on b.BankID = [2425].BankID
left join @msmathbanks_2324 [2324] on b.BankID = [2324].BankID
left join @msmathbanks_2223 [2223] on b.BankID = [2223].BankID
left join @msmathbanks_2122 [2122] on b.BankID = [2122].BankID
left join @msmathbanks_2021 [2021] on b.BankID = [2021].BankID
left join @msmathbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name not like '%Module%' and vt.Name not like '%Prior Gr%'
and (vt.BankID in (select * from @msmathbanks_2425) 
or vt.BankID in (select * from @msmathbanks_2324) 
or vt.BankID in (select * from @msmathbanks_2223) 
or vt.BankID in (select * from @msmathbanks_2122) 
or vt.BankID in (select * from @msmathbanks_2021) 
or vt.BankID in (select * from @msmathbanks_1920))
group by g.Name, sub.Name, sc.Name

-- Keystone HS Alg I
insert into @bm select sc.Name, g.Name, 'Keystone Algebra I', max(tr.ResultDate),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsmathbanks_2425 [2425] on b.BankID = [2425].BankID
left join @hsmathbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsmathbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsmathbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsmathbanks_2021 [2021] on b.BankID = [2021].BankID
left join @hsmathbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name not like '%Module%' and vt.Name not like '%Prior Gr%'
and (vt.BankID in (select * from @hsmathbanks_2425)
or vt.BankID in (select * from @hsmathbanks_2324) 
or vt.BankID in (select * from @hsmathbanks_2223) 
or vt.BankID in (select * from @hsmathbanks_2122) 
or vt.BankID in (select * from @hsmathbanks_2021) 
or vt.BankID in (select * from @hsmathbanks_1920))
group by g.Name, sub.Name, sc.Name

-- Keystone HS Alg I - Mod I
insert into @bm select sc.Name, g.Name, 'Keystone Algebra I Module I', max(tr.ResultDate),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsmathbanks_2425 [2425] on b.BankID = [2425].BankID
left join @hsmathbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsmathbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsmathbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsmathbanks_2021 [2021] on b.BankID = [2021].BankID
left join @hsmathbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Module I:%' and vt.Name not like '%Prior Gr%'
and (vt.BankID in (select * from @hsmathbanks_2425) 
or vt.BankID in (select * from @hsmathbanks_2324) 
or vt.BankID in (select * from @hsmathbanks_2223) 
or vt.BankID in (select * from @hsmathbanks_2122) 
or vt.BankID in (select * from @hsmathbanks_2021) 
or vt.BankID in (select * from @hsmathbanks_1920))
group by g.Name, sub.Name, sc.Name

-- Keystone HS Alg I - Mod II
insert into @bm select sc.Name, g.Name, 'Keystone Algebra I Module II', max(tr.ResultDate),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsmathbanks_2425 [2425] on b.BankID = [2425].BankID
left join @hsmathbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsmathbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsmathbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsmathbanks_2021 [2021] on b.BankID = [2021].BankID
left join @hsmathbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Module II:%' and vt.Name not like '%Prior Gr%'
and (vt.BankID in (select * from @hsmathbanks_2425) 
or vt.BankID in (select * from @hsmathbanks_2324) 
or vt.BankID in (select * from @hsmathbanks_2223) 
or vt.BankID in (select * from @hsmathbanks_2122) 
or vt.BankID in (select * from @hsmathbanks_2021) 
or vt.BankID in (select * from @hsmathbanks_1920))
group by g.Name, sub.Name, sc.Name

-- Keystone HS Lit
insert into @bm select sc.Name, g.Name, 'Keystone Literature', max(tr.ResultDate),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hslitbanks_2425 [2425] on b.BankID = [2425].BankID
left join @hslitbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hslitbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hslitbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hslitbanks_2021 [2021] on b.BankID = [2021].BankID
left join @hslitbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name not like '%Module%' and vt.Name not like '%Prior Gr%'
and (vt.BankID in (select * from @hslitbanks_2425)
or vt.BankID in (select * from @hslitbanks_2324) 
or vt.BankID in (select * from @hslitbanks_2223) 
or vt.BankID in (select * from @hslitbanks_2122) 
or vt.BankID in (select * from @hslitbanks_2021) 
or vt.BankID in (select * from @hslitbanks_1920))
group by g.Name, sub.Name, sc.Name

-- Keystone HS Lit - Mod I
insert into @bm select sc.Name, g.Name, 'Keystone Literature Module I', max(tr.ResultDate),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hslitbanks_2425 [2425] on b.BankID = [2425].BankID
left join @hslitbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hslitbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hslitbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hslitbanks_2021 [2021] on b.BankID = [2021].BankID
left join @hslitbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Module I:%' and vt.Name not like '%Prior Gr%'
and (vt.BankID in (select * from @hslitbanks_2425) 
or vt.BankID in (select * from @hslitbanks_2223) 
or vt.BankID in (select * from @hslitbanks_2122) 
or vt.BankID in (select * from @hslitbanks_2021) 
or vt.BankID in (select * from @hslitbanks_1920))
group by g.Name, sub.Name, sc.Name

-- Keystone HS Lit - Mod II
insert into @bm select sc.Name, g.Name, 'Keystone Literature Module II', max(tr.ResultDate),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hslitbanks_2425 [2425] on b.BankID = [2425].BankID
left join @hslitbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hslitbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hslitbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hslitbanks_2021 [2021] on b.BankID = [2021].BankID
left join @hslitbanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Module II:%' and vt.Name not like '%Prior Gr%'
and (vt.BankID in (select * from @hslitbanks_2425)
or vt.BankID in (select * from @hslitbanks_2324) 
or vt.BankID in (select * from @hslitbanks_2223) 
or vt.BankID in (select * from @hslitbanks_2122) 
or vt.BankID in (select * from @hslitbanks_2021) 
or vt.BankID in (select * from @hslitbanks_1920))
group by g.Name, sub.Name, sc.Name

-- Keystone HS Eng I (non-Keystone)
insert into @bm select sc.Name, g.Name, 'LinkIt! HS English I', max(tr.ResultDate),
'','','', -- no 19-20
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsengbanks_2425 [2425] on b.BankID = [2425].BankID
left join @hsengbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsengbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsengbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsengbanks_2021 [2021] on b.BankID = [2021].BankID
where sc.DistrictID = @districtid and vt.Name like '%Eng I %' and vt.Name not like '%Prior Gr%'
and (vt.BankID in (select * from @hsengbanks_2425)
or vt.BankID in (select * from @hsengbanks_2324) 
or vt.BankID in (select * from @hsengbanks_2223) 
or vt.BankID in (select * from @hsengbanks_2122) 
or vt.BankID in (select * from @hsengbanks_2021))
group by g.Name, sub.Name, sc.Name

-- Keystone HS Eng III (non-Keystone)
insert into @bm select sc.Name, g.Name, 'LinkIt! HS English III', max(tr.ResultDate),
'','','', -- no 19-20
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsengbanks_2425 [2425] on b.BankID = [2425].BankID
left join @hsengbanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsengbanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsengbanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsengbanks_2021 [2021] on b.BankID = [2021].BankID
where sc.DistrictID = @districtid and vt.Name like '%Eng III %' and vt.Name not like '%Prior Gr%'
and (vt.BankID in (select * from @hsengbanks_2425)
or vt.BankID in (select * from @hsengbanks_2324) 
or vt.BankID in (select * from @hsengbanks_2223) 
or vt.BankID in (select * from @hsengbanks_2122) 
or vt.BankID in (select * from @hsengbanks_2021))
group by g.Name, sub.Name, sc.Name

-- Keystone HS Bio
insert into @bm select sc.Name, g.Name, 'Keystone Biology', max(tr.ResultDate),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsbiobanks_2425 [2425] on b.BankID = [2425].BankID
left join @hsbiobanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsbiobanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsbiobanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsbiobanks_2021 [2021] on b.BankID = [2021].BankID
left join @hsbiobanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name not like '%Module%' and vt.Name not like '%Prior Gr%'
and (vt.BankID in (select * from @hsbiobanks_2425) 
or vt.BankID in (select * from @hsbiobanks_2324) 
or vt.BankID in (select * from @hsbiobanks_2223)
or vt.BankID in (select * from @hsbiobanks_2122) 
or vt.BankID in (select * from @hsbiobanks_2021) 
or vt.BankID in (select * from @hsbiobanks_1920))
group by g.Name, sub.Name, sc.Name

-- Keystone HS Bio Mod I
insert into @bm select sc.Name, g.Name, 'Keystone Biology Module I', max(tr.ResultDate),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsbiobanks_2425 [2425] on b.BankID = [2425].BankID
left join @hsbiobanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsbiobanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsbiobanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsbiobanks_2021 [2021] on b.BankID = [2021].BankID
left join @hsbiobanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Module I:%' and vt.Name not like '%Prior Gr%'
and (vt.BankID in (select * from @hsbiobanks_2425)
or vt.BankID in (select * from @hsbiobanks_2324) 
or vt.BankID in (select * from @hsbiobanks_2223) 
or vt.BankID in (select * from @hsbiobanks_2122) 
or vt.BankID in (select * from @hsbiobanks_2021) 
or vt.BankID in (select * from @hsbiobanks_1920))
group by g.Name, sub.Name, sc.Name

-- Keystone HS Bio Mod II
insert into @bm select sc.Name, g.Name, 'Keystone Biology Module II', max(tr.ResultDate),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([1920].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2021].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2122].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2223].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2324].BankID) and vt.Name like '%Form C%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form A%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form B%' then 1 else 0 end),
sum(case when vt.BankID in ([2425].BankID) and vt.Name like '%Form C%' then 1 else 0 end)
from TestResult tr with (nolock)
Join School sc with (nolock) on sc.SchoolID = tr.SchoolID
Join VirtualTest vt with (nolock) on vt.VirtualTestID = tr.VirtualTestID
Join Bank b with (nolock) on B.BankID = vt.BankID
Join [Subject] sub with (nolock) on sub.SubjectID = B.SubjectID
Join Grade g with (nolock) on g.GradeID = sub.GradeID
left join @hsbiobanks_2425 [2425] on b.BankID = [2425].BankID
left join @hsbiobanks_2324 [2324] on b.BankID = [2324].BankID
left join @hsbiobanks_2223 [2223] on b.BankID = [2223].BankID
left join @hsbiobanks_2122 [2122] on b.BankID = [2122].BankID
left join @hsbiobanks_2021 [2021] on b.BankID = [2021].BankID
left join @hsbiobanks_1920 [1920] on b.BankID = [1920].BankID
where sc.DistrictID = @districtid and vt.Name like '%Module II:%' and vt.Name not like '%Prior Gr%'
and (vt.BankID in (select * from @hsbiobanks_2425) 
or vt.BankID in (select * from @hsbiobanks_2324) 
or vt.BankID in (select * from @hsbiobanks_2223) 
or vt.BankID in (select * from @hsbiobanks_2122)
or vt.BankID in (select * from @hsbiobanks_2021)
or vt.BankID in (select * from @hsbiobanks_1920))
group by g.Name, sub.Name, sc.Name


-- INSERTING CLASS -----------------------------------
-- K-8
insert into @classbm
select sc.Name, g.Name, sub.Name, u.FullName, c.Name,
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
where sc.DistrictID = @districtid and g.GradeID not in (52,33) --exclude Gr 6-8, 9-12
and vt.BankID in (select * from @k8banks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- Keystone MS Alg I
insert into @classbm
select sc.Name, g.Name, 'Keystone Algebra I', u.FullName, c.Name,
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
where sc.DistrictID = @districtid and vt.Name not like '%Module%'
and vt.BankID in (select * from @msmathbanks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- Keystone HS Alg I
insert into @classbm
select sc.Name, g.Name, 'Keystone Algebra I', u.FullName, c.Name,
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
where sc.DistrictID = @districtid and vt.Name not like '%Module%'
and vt.BankID in (select * from @hsmathbanks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- Keystone HS Alg I Mod I
insert into @classbm
select sc.Name, g.Name, 'Keystone Algebra I Module I', u.FullName, c.Name,
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
where sc.DistrictID = @districtid and vt.Name like '%Module I:%'
and vt.BankID in (select * from @hsmathbanks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- Keystone HS Alg I Mod II
insert into @classbm
select sc.Name, g.Name, 'Keystone Algebra I Module II', u.FullName, c.Name,
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
where sc.DistrictID = @districtid and vt.Name like '%Module II:%'
and vt.BankID in (select * from @hsmathbanks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- Keystone HS Lit
insert into @classbm
select sc.Name, g.Name, 'Keystone Literature', u.FullName, c.Name,
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
where sc.DistrictID = @districtid and vt.Name not like '%Module%'
and vt.BankID in (select * from @hslitbanks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- Keystone HS Lit Mod I
insert into @classbm
select sc.Name, g.Name, 'Keystone Literature Module I', u.FullName, c.Name,
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
where sc.DistrictID = @districtid and vt.Name like '%Module I:%'
and vt.BankID in (select * from @hslitbanks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- Keystone HS Lit Mod II
insert into @classbm
select sc.Name, g.Name, 'Keystone Literature Module II', u.FullName, c.Name,
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
where sc.DistrictID = @districtid and vt.Name like '%Module II:%'
and vt.BankID in (select * from @hslitbanks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- Keystone HS Eng I (non-Keystone)
insert into @classbm
select sc.Name, g.Name, 'LinkIt! HS English I', u.FullName, c.Name,
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
and vt.BankID in (select * from @hsengbanks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- Keystone HS Eng III (non-Keystone)
insert into @classbm
select sc.Name, g.Name, 'LinkIt! HS English III', u.FullName, c.Name,
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
and vt.BankID in (select * from @hsengbanks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- Keystone HS Bio
insert into @classbm
select sc.Name, g.Name, 'Keystone Biology', u.FullName, c.Name,
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
where sc.DistrictID = @districtid and vt.Name not like '%Module%'
and vt.BankID in (select * from @hsbiobanks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- Keystone HS Bio
insert into @classbm
select sc.Name, g.Name, 'Keystone Biology Module I', u.FullName, c.Name,
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
where sc.DistrictID = @districtid and vt.Name like '%Module I:%'
and vt.BankID in (select * from @hsbiobanks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name

-- Keystone HS Bio
insert into @classbm
select sc.Name, g.Name, 'Keystone Biology Module II', u.FullName, c.Name,
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
where sc.DistrictID = @districtid and vt.Name like '%Module II:%'
and vt.BankID in (select * from @hsbiobanks_2425)
group by sc.Name, g.Name, sub.Name, u.FullName, c.Name


------------------ EXTRACTS --------------------------
-- DISTRICT -------------------------
select Grade, Subject, max([Latest Results]) as [Latest Results],
sum([22-23 Form A]) as [22-23 Form A], sum([22-23 Form B]) as [22-23 Form B], sum([22-23 Form C]) as [22-23 Form C],
sum([23-24 Form A]) as [23-24 Form A], sum([23-24 Form B]) as [23-24 Form B], sum([23-24 Form C]) as [23-24 Form C],
sum([24-25 Form A]) as [24-25 Form A], sum([24-25 Form B]) as [24-25 Form B], sum([24-25 Form C]) as [24-25 Form C]
from @bm
where ([22-23 Form A]+[22-23 Form B]+[22-23 Form C]+[23-24 Form A]+[23-24 Form B]+[23-24 Form C]+[24-25 Form A]+[24-25 Form B]+[24-25 Form C])>=0
group by Grade, Subject
order by case when Grade = 'K' then 0
			  when Grade = '6-8' then 9 
			  when Grade = '9-12' then 10
			  else Grade end,
		 Subject

-- SCHOOL ---------------------------
select School, Grade, Subject, max([Latest Results]) as [Latest Results],
sum([22-23 Form A]) as [22-23 Form A], sum([22-23 Form B]) as [22-23 Form B], sum([22-23 Form C]) as [22-23 Form C],
sum([23-24 Form A]) as [23-24 Form A], sum([23-24 Form B]) as [23-24 Form B], sum([23-24 Form C]) as [23-24 Form C],
sum([24-25 Form A]) as [24-25 Form A], sum([24-25 Form B]) as [24-25 Form B], sum([24-25 Form C]) as [24-25 Form C]
from @bm
where ([22-23 Form A]+[22-23 Form B]+[22-23 Form C]+[23-24 Form A]+[23-24 Form B]+[23-24 Form C]+[24-25 Form A]+[24-25 Form B]+[24-25 Form C])>=0
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
sum([23-24 Form A]) as [23-24 A], sum([23-24 Form B]) as [23-24 B], sum([23-24 Form C]) as [23-24 C],
sum([24-25 Form A]) as [24-25 A], sum([24-25 Form B]) as [24-25 B], sum([24-25 Form C]) as [24-25 C]
from @bm
group by Grade, Subject
order by case when Grade = 'K' then 0
			  when Grade = '6-8' then 9 
			  when Grade = '9-12' then 10
			  else Grade end,
		 Subject

