;with x as (
    select
        district.districtid,
        district.name,
        JSONDataConfig,
        ROW_NUMBER() OVER (PARTITION BY district.DistrictID ORDER BY ImportType) as rn
    from districtdataparm with (nolock)
        join district with (nolock) on districtdataparm.DistrictID = district.DistrictID
    where district.districtid in (6882,6896,6815,6098,6808,3236,4732,6842,5765,5612,5284,4644,4543,3096,4180,3114,6554,4697,4469,6769,4876,3949,4287,6798,6836)
    and importtype like 'PSSA%'
)
select *
from x
where rn = 1
order by 2 asc
