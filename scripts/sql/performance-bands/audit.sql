-- 2023-03-12
declare @dsc int = 957
declare @stateid int = 49
declare @year varchar(10) = '2023-24'

declare @vts table (vtid int, dsc int, stateid int)

insert into @vts
    select distinct vt.VirtualTestID, vt.DataSetCategoryID, vt.StateID
    from VirtualTest vt with (nolock)
    where vt.name like @year + '%'


declare @t1 table (tr_label varchar(100), dsc int, stateid int)
declare @t2 table (config_label varchar(100), dsc int, stateid int)

insert into @t1
select distinct trss.name, vt.dsc, vt.stateid
    from TestResult tr with (nolock) 
    join TestResultScore trs with (nolock) on tr.TestResultID = trs.TestResultID
    join TestResultSubScore trss with (nolock) on trs.TestResultScoreID = trss.TestResultScoreID
    join @vts vt on tr.VirtualTestID = vt.vtid

insert into @t2
select distinct SubscoreName, DataSetCategoryID, StateID
from PerformanceBandConfiguration with (nolock)
where DistrictID is null--= @districtid
and ScoreTier = 2

-- select * from @t1 t1 
--     inner join @t2 t2 on t1.tr_label COLLATE Latin1_General_CS_AS = t2.config_label COLLATE Latin1_General_CS_AS

declare @tr_only table (tr_label varchar(100), config_label varchar(100), dsc int, stateid int)

insert into @tr_only
select t1.tr_label, t2.config_label, t1.dsc, t1.stateid from @t1 t1 
    left join @t2 t2 on t1.tr_label COLLATE Latin1_General_CS_AS = t2.config_label COLLATE Latin1_General_CS_AS
        and t1.dsc = t2.dsc
        and t1.stateid = t2.stateid
where t2.config_label is null

declare @config_only table (tr_label varchar(100), config_label varchar(100), dsc int, stateid int)

insert into @config_only
select t1.tr_label, t2.config_label, t1.dsc, t1.stateid from @t1 t1 
    right join @t2 t2 on t1.tr_label COLLATE Latin1_General_CS_AS = t2.config_label COLLATE Latin1_General_CS_AS
        and t1.dsc = t2.dsc
        and t1.stateid = t2.stateid
where t1.tr_label is null


declare @affected table (tr_label varchar(100), config_label varchar(100), dsc int, stateid int)

insert into @affected
select tr.tr_label, config.config_label, tr.dsc, tr.stateid
from @tr_only tr
join (
    select *,
        ROW_NUMBER() OVER (PARTITION BY config_label ORDER BY config_label) AS rn
    from @config_only
) config
on tr.tr_label = config.config_label and config.rn = 1

select * from @tr_only

select * from @config_only

select * from @affected


-- use affected as a map to create new configs
-- BEGIN TRAN

INSERT INTO PerformanceBandConfiguration (DistrictID,StateID,Year,Season,DataSetCategoryID,Subject,Grade,Keyword,ScoreTier,SubscoreName,ScoreName,PerformanceBandGroupID,Cutoffs,IsPrincipalLevel,CreatedDate,UpdatedDate)
SELECT DistrictID,StateID,Year,Season,DataSetCategoryID,Subject,Grade,Keyword,ScoreTier,map.tr_label,ScoreName,PerformanceBandGroupID,Cutoffs,IsPrincipalLevel,GETDATE(),GETDATE()
FROM PerformanceBandConfiguration pbc
    join @affected map on pbc.SubscoreName COLLATE Latin1_General_CS_AS = map.config_label COLLATE Latin1_General_CS_AS
where districtid is null--= @districtid
and stateid = @stateid
and datasetcategoryid = @dsc
and scoretier = 2
and [Year] = @year

-- select count(*)
-- from PerformanceBandConfiguration with (nolock)
-- where datasetcategoryid = 957
-- and districtid is null
-- and stateid = 49
-- and scoretier = 2

-- ROLLBACK TRAN
