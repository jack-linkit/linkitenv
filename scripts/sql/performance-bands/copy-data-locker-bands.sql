declare @map table (old int, new int)
insert into @map
select vt1.VirtualTestID, vt2.virtualtestid from virtualtest vt1 with (nolock)
    join virtualtest vt2 with (nolock) on vt2.name = REPLACE(vt1.name, '2023-24', '2024-25')
where vt1.VirtualTestID in (3614831,3614832,3614833,3552406,3569885,3569886,3725396,3725397,3725398,3614835,3614836,3614839,3569890,3569891,3569892,3725399,3725400,3725401,3569897,3569898,3569899,3725402,3725403,3725404,3569900,3569902,3569903,3725405,3725406,3725407,3725408,3725409,3725410,3725411,3725412,3725413)


begin tran
insert into PerformanceBandVirtualTest (VirtualTestID, CreatedBy, CreatedOn, Locked, Level, ID, UpdatedBy, UpdatedOn)
select map.new, 4940734, GETUTCDATE(), Locked, Level, ID, 4940734, GETUTCDATE() from virtualtest vt with (nolock)
    join PerformanceBandVirtualTest pbvt with (nolock) on vt.VirtualTestID = pbvt.VirtualTestID
    -- join PerformanceBandVirtualTestScoreSetting pbvtss with (nolock) on pbvt.PerformanceBandVirtualTestID = pbvtss.PerformanceBandVirtualTestID 
    join @map map on vt.VirtualTestID = map.old
where vt.VirtualTestID in (3614831,3614832,3614833,3552406,3569885,3569886,3725396,3725397,3725398,3614835,3614836,3614839,3569890,3569891,3569892,3725399,3725400,3725401,3569897,3569898,3569899,3725402,3725403,3725404,3569900,3569902,3569903,3725405,3725406,3725407,3725408,3725409,3725410,3725411,3725412,3725413)
and pbvt.level = 2
and pbvt.id = 6631

declare @map2 table (old int, new int)
insert into @map2
select pbvt1.PerformanceBandVirtualTestID, pbvt2.PerformanceBandVirtualTestID
from @map map
    join PerformanceBandVirtualTest pbvt1 with (nolock) on pbvt1.VirtualTestID = map.old
    join PerformanceBandVirtualTest pbvt2 with (nolock) on pbvt2.VirtualTestID = map.new

insert into PerformanceBandVirtualTestScoresetting (PerformanceBandVirtualTestID, CreatedBy, CreatedOn, PerformanceBandGroupID, Cutoffs, ScoreType, Colors, UpdatedBy, UpdatedOn, Label, IsPrincipalLevel)
select map.new, 4940734, GETUTCDATE(), PerformanceBandGroupID, Cutoffs, ScoreType, Colors, 4940734, GETUTCDATE(), Label, IsPrincipalLevel
from PerformanceBandVirtualTestScoreSetting pbvtss
    join @map2 map on pbvtss.PerformanceBandVirtualTestID = map.old

insert into PerformanceBandVirtualTestSubScoresetting (PerformanceBandVirtualTestID, CreatedBy, CreatedOn, PerformanceBandGroupID, Cutoffs, ScoreType, Colors, UpdatedBy, UpdatedOn, Label, IsPrincipalLevel, SubScoreName)
select map.new, 4940734, GETUTCDATE(), PerformanceBandGroupID, Cutoffs, ScoreType, Colors, 4940734, GETUTCDATE(), Label, IsPrincipalLevel, SubscoreName
from PerformanceBandVirtualTestSubScoreSetting pbvtss
    join @map2 map on pbvtss.PerformanceBandVirtualTestID = map.old

commit tran

