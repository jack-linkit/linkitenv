select 
    d.DistrictID,
    d.Name,
    cast(q.TimeStart as Date) as 'Date',
    case when du.UploadTypeID = 5 then 'Data' else 'Roster' end as 'Upload Type',
    count(q.xpsQueueID) as 'Number of errors'
    -- sum(case when q.xpsQueueResultID = 2 then 1 else 0 end) as 'Number of Errors'
from 
    xpsDistrictUpload du with (nolock)
join District d with (nolock)
    on du.DistrictID = d.DistrictID
join xpsQueue q with (nolock) 
    on du.xpsDistrictUploadID = q.xpsDistrictUploadID
where d.DistrictID in (6920,5156,6081,4582,4519,3856,4385,4635,4324,5529,2498,6469,6631,5072,6501,5465,6587,6275,6247,5628,5483,5160,4984,4760,6707,4569,4539,4164,4322,3112,3982,3860,6723,6022,6717,4559,3081,4877,5309,3686,6762,6688,4803,4541,4552,5532,5549,3643,6210,4254,3883)
    and q.xpsQueueStatusID = 6
    and q.TimeStart > DATEADD(DAY, -1, GETUTCDATE())
    and q.xpsQueueresultid = 2
group by d.DistrictID, d.Name, q.xpsQueueResultID, du.UploadTypeID, CAST(q.TimeStart as DATE)
