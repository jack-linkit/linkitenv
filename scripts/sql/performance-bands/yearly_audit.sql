
-- 2023-24 vs. 2024-25

with currentbands(dsc_id, dsc_name) as (
	select vt.datasetcategoryid, dsc.datasetcategoryname
	from virtualtest vt with (nolock)
		join datasetcategory dsc with (nolock)
			on vt.datasetcategoryid = dsc.datasetcategoryid
		join performancebandvirtualtest pbvt with (nolock)
			on vt.virtualtestid = pbvt.virtualtestid
	where pbvt.[level] = 0
		and vt.stateid = 49
		and vt.datasetoriginid = 11
		and vt.name like '2023-24%'
	group by vt.datasetcategoryid, dsc.datasetcategoryname
)
select
	bands.dsc_id as 'datasetcategoryid',
	bands.dsc_name 'dataset name',
	case when count(vt.virtualtestid)> 0 then 'Y' else 'N' end as '24-25 test created',
	case when count(pbc.performancebandconfigurationid) > 0 then 'Y' else 'N' end as '24-25 bands configured',
	case when count(pbvt.performancebandvirtualtestid) > 0 then 'Y' else 'N' end as '24-25 bands applied'
from currentbands bands with (nolock)
	left join virtualtest vt on vt.datasetcategoryid = bands.dsc_id and vt.stateid = 49 and vt.datasetoriginid = 11 and vt.name like '2024-25%'
	left join performancebandvirtualtest pbvt with (nolock) on vt.virtualtestid = pbvt.virtualtestid and pbvt.level = 0 
	left join performancebandconfiguration pbc with (nolock) on pbc.datasetcategoryid = vt.datasetcategoryid and pbc.year = '2024-25' and pbc.DistrictID is null
group by bands.dsc_id, bands.dsc_name
order by 3 desc, 4 desc, 5 desc;

-- 2022-23 vs. 2023-24

with currentbands(dsc_id, dsc_name) as (
	select vt.datasetcategoryid, dsc.datasetcategoryname
	from virtualtest vt with (nolock)
		join datasetcategory dsc with (nolock)
			on vt.datasetcategoryid = dsc.datasetcategoryid
		join performancebandvirtualtest pbvt with (nolock)
			on vt.virtualtestid = pbvt.virtualtestid
	where pbvt.[level] = 0
		and vt.stateid = 49
		and vt.datasetoriginid = 11
		and vt.name like '2022-23%'
	group by vt.datasetcategoryid, dsc.datasetcategoryname
)
select 
	bands.dsc_id as 'datasetcategoryid',
	bands.dsc_name 'dataset name',
	case when count(vt.virtualtestid)> 0 then 'Y' else 'N' end as '23-24 test created',
	case when count(pbc.performancebandconfigurationid) > 0 then 'Y' else 'N' end as '23-24 bands configured',
	case when count(pbvt.performancebandvirtualtestid) > 0 then 'Y' else 'N' end as '24-24 bands applied'
from currentbands bands with (nolock)
	left join virtualtest vt on vt.datasetcategoryid = bands.dsc_id and vt.stateid = 49 and vt.datasetoriginid = 11 and vt.name like '2023-24%'
	left join performancebandvirtualtest pbvt with (nolock) on vt.virtualtestid = pbvt.virtualtestid and pbvt.level = 0
	left join performancebandconfiguration pbc with (nolock) on pbc.datasetcategoryid = vt.datasetcategoryid and pbc.year = '2024-25' and pbc.DistrictID is null
group by bands.dsc_id, bands.dsc_name
order by 3 desc, 4 desc, 5 desc;
