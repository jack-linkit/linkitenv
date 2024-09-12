
-- 2023-24 vs. 2024-25

with currentbands(dsc_id, dsc_name) as (
	select vt.datasetcategoryid, dsc.datasetcategoryname
	from virtualtest vt with (nolock)
		join datasetcategory dsc with (nolock)
			on vt.datasetcategoryid = dsc.datasetcategoryid
		join performancebandvirtualtest pbvt with (nolock)
			on vt.virtualtestid = pbvt.virtualtestid
	where pbvt.[level] = 0
		and vt.datasetoriginid in (11,1)
		and vt.name like '2023-24%'
	group by vt.datasetcategoryid, dsc.datasetcategoryname
),
data_table(dsc_id, dsc_name, test_created, bands_configured, bands_applied, st_name) as (
select distinct
	bands.dsc_id as 'datasetcategoryid',
	bands.dsc_name 'dataset name',
	case when count(vt.virtualtestid)> 0 then 'Y' else 'N' end as '24-25 test created',
	case when count(pbc.performancebandconfigurationid) > 0 then 'Y' else 'N' end as '24-25 bands configured',
	case when count(pbvt.performancebandvirtualtestid) > 0 then 'Y' else 'N' end as '24-25 bands applied',
    case when [State].Name is null and count(pbc.PerformanceBandConfigurationID) > 0 then 'Enterprise' else [State].name end
from currentbands bands with (nolock)
	left join virtualtest vt on vt.datasetcategoryid = bands.dsc_id and vt.datasetoriginid in (11,1) and vt.name like '2024-25%'
	left join performancebandvirtualtest pbvt with (nolock) on vt.virtualtestid = pbvt.virtualtestid and pbvt.level = 0 
	left join performancebandconfiguration pbc with (nolock) on pbc.datasetcategoryid = bands.dsc_id and pbc.year = '2024-25' and pbc.DistrictID is null
    left join [state] with (nolock) on pbc.stateid = [State].stateid
group by bands.dsc_id, bands.dsc_name, [State].name
-- order by 4 desc, 3 desc, 5 desc, 2 desc
)
select 
    dsc_id,
    dsc_name,
    bands_configured as '24-25 Bands Configured',
    test_created as '24-25 Test Created',
    bands_applied as '24-25 Bands Applied',
    -- case when bands_applied = 'Y' and string_agg(convert(nvarchar(max), st_name), ',') is null then 'All States' else string_agg(convert(nvarchar(max), st_name), ',')  END as 'States Applied'
    string_agg(convert(nvarchar(max), st_name), ',')
from data_table dt
group by dsc_id, dsc_name, bands_configured, test_created, bands_applied
order by 3 desc, 4 desc, 5 desc, 2 desc;