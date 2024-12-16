
BEGIN TRAN

;with x as (
    select * from PerformanceBandConfiguration with (nolock)
    where districtid = 4254
    and DataSetCategoryID = 25
    and [Year] = '2023-24'
) 
INSERT INTO PerformanceBandConfiguration (DistrictID,StateID,Year,Season,DataSetCategoryID,Subject,Grade,Keyword,ScoreTier,SubscoreName,ScoreName,PerformanceBandGroupID,Cutoffs,IsPrincipalLevel,CreatedDate,UpdatedDate)
SELECT DistrictID,StateID,'2024-25',Season,DataSetCategoryID,Subject,Grade,Keyword,ScoreTier,SubscoreName,ScoreName,PerformanceBandGroupID,Cutoffs,IsPrincipalLevel,GETUTCDATE(),GETUTCDATE()
from x

ROLLBACK TRAN

