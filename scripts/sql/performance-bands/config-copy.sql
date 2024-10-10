BEGIN TRAN

INSERT INTO PerformanceBandConfiguration (DistrictID,StateID,Year,Season,DataSetCategoryID,Subject,Grade,Keyword,ScoreTier,SubscoreName,ScoreName,PerformanceBandGroupID,Cutoffs,IsPrincipalLevel,CreatedDate,UpdatedDate)
SELECT @districtID,StateID,Year,Season,DataSetCategoryID,Subject,Grade,Keyword,ScoreTier,SubscoreName,ScoreName,PerformanceBandGroupID,Cutoffs,IsPrincipalLevel,GETUTCDATE(),GETUTCDATE()
FROM PerformanceBandConfiguration
WHERE -- set conditions

ROLLBACK TRAN
