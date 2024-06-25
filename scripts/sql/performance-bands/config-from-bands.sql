-- insert only overall bands from a given dataset for a given district and year

declare @districtid int = 4539

declare @dsc int = 34

declare @year varchar(10) = '23-24'

declare @seasons table (name varchar(10))
insert into @seasons
values ('Fall'), ('Winter'), ('Spring')

declare @grades table (name varchar(10))
insert into @grades
values ('K'), ('1'), ('2'), ('3'), ('4'), ('5'), ('6')

begin tran

;with x as (
    select
        pbvt.ID as DistrictID,
        vt.StateID as StateID,
        @year as Year,
        szn.name as Season,
        vt.DataSetCategoryID as DataSetCategoryID,
        subject.name as Subject, grade.name as Grade,
        NULL as Keyword, 1 as ScoreTier, NULL as SubScoreName,
        pbvtss.ScoreType as ScoreName,
        pbvtss.PerformanceBandGroupID as PerformanceBandGroupID,
        pbvtss.Cutoffs as Cutoffs, 
        1 as IsPrincipleLevel,
        GETUTCDATE() as CreatedDate, 
        GETUTCDATE() as ModifiedDate
    from virtualtest vt with (nolock) 
        join @seasons szn on vt.name like '%' + szn.name + '%'
        join @grades grade on vt.name like '%Gr ' + grade.name + '%'
        join Bank on vt.BankID = Bank.BankID
        join subject on bank.subjectID = subject.SubjectID
        join PerformanceBandVirtualTest pbvt with (nolock) on pbvt.VirtualTestID = vt.VirtualTestID
        join PerformanceBandVirtualTestScoreSetting pbvtss with (nolock) on pbvt.PerformanceBandVirtualTestID = pbvtss.PerformanceBandVirtualTestID
    where vt.name like @year + '%'
    and vt.DataSetCategoryID = @dsc
    and pbvt.ID = @DistrictID
)

INSERT INTO PerformanceBandConfiguration (DistrictID,StateID,Year,Season,DataSetCategoryID,Subject,Grade,Keyword,ScoreTier,SubscoreName,ScoreName,PerformanceBandGroupID,Cutoffs,IsPrincipalLevel,CreatedDate,UpdatedDate)
select * from x;
