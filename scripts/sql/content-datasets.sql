select distinct 
    dsc.DataSetCategoryName,
    CASE
        WHEN integration.DistrictDataParmID is null THEN 'Manual Upload'
        ElSE 'Integration or ETL' 
    END AS 'Upload Type'
from VirtualTest vt with (nolock)
    join TestResult tr with (nolock) on vt.VirtualTestID = tr.VirtualTestID
    join DataSetCategory dsc with (nolock) on vt.DataSetCategoryID = dsc.DataSetCategoryID
    left join DistrictDataParm integration with (nolock) on dsc.DataSetCategoryID = integration.DataSetCategoryID and tr.DistrictID = integration.DistrictID
where tr.DistrictID = 4164
and vt.DataSetOriginID = 11
and vt.name like '2023-24%'
order by 'Upload Type'
