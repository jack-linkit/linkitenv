declare @districts table (districtid int, districtname varchar(100))
insert into @districts (districtid, districtname)
select distinct tr.districtid, d.name
from virtualtest vt with (nolock)
    join testresult tr with (nolock) on vt.VirtualTestID = tr.VirtualTestID
    join district d with (nolock) on tr.DistrictID = d.DistrictID
where tr.DistrictID in (6887,6874,6843,6873,6929,6870,3136,6787,6862,6920,5156,6081,4582,4519,3856,4385,4635,4324,2498,6469,6631,6501,5465,6587,6275,6247,5628,5160,4984,4760,6707,4539,4164,4322,3112,3982,3860,6723,6022,6717,4559,3081,4877,5309,3686,6762,6688,4803,4552,5532,3643,6210,4254)
and vt.VirtualTestType = 5
and d.stateid not in (57, 49)
and (tr.ResultDate > '2023-07-31' or vt.name like '%23-24%' or vt.name like '%2023-24%' or vt.name like '%2023-2024%')
order by tr.DistrictID asc

select * from @districts

;with x as (
    select DistrictID, Name from District with (nolock)
    where DistrictID in (6887,6874,6843,6873,6929,6870,3136,6787,6862,6920,5156,6081,4582,4519,3856,4385,4635,4324,2498,6469,6631,6501,5465,6587,6275,6247,5628,5160,4984,4760,6707,4539,4164,4322,3112,3982,3860,6723,6022,6717,4559,3081,4877,5309,3686,6762,6688,4803,4552,5532,3643,6210,4254)
    and stateid not in (49, 57)
)

select x.DistrictID, x.name
from x
left join @districts d on x.DistrictID = d.districtid
where d.districtid is null
order by x.DistrictID asc
