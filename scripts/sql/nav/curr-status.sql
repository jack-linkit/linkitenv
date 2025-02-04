select 
    d.DistrictID, d.Name, count(tr.TestResultID)
from virtualtest vt with (nolock)
    join testresult tr with (nolock) on vt.virtualtestid = tr.virtualtestid 
    join district d with (nolock) on d.DistrictID = tr.DistrictID
where vt.DataSetCategoryID = 768
and vt.name like '2024-25%Form B%'
and d.DistrictID in (6934,6738,5309,5529,3860,6275,6247,4102,4984,5465,3883,5549,6081,6587,3856,6874,6610,6631,4803,4254,7024,6787,6501,3686,6870,4541,3081,6873,6670,6920,6469,5483,6524,5628,4164,6994,6929,6862)
group by d.DistrictID, d.Name
order by count(tr.TestResultID) desc
