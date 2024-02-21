/*** Delete all district-specific performance bands, based on DistrictID and VirtualTest.Name ***/
BEGIN TRAN

-- Define the district and virtual test
DECLARE @DistrictID INT = ''
DECLARE @VirtualTestNameLike VARCHAR(50) = '%%'

-- Create a temp table with corresponding records
DECLARE @PerformanceBandRecordsToDelete TABLE (
	TestName VARCHAR(MAX),
	PerformanceBandVirtualTestID INT,
	PerformanceBandVirtualTestScoreSettingID INT,
	ScorePerformanceBandGroupID INT,
	ScoreCutoffs VARCHAR(30),
	ScoreScoreType VARCHAR(30),
	PerformanceBandVirtualTestSubScoreSettingID INT,
	SubScorePerformanceBandGroupID INT,
	SubScoreCutoffs VARCHAR(30),
	SubScoreScoreType VARCHAR(30),
	SubScoreName VARCHAR(MAX)
	)

-- Change the WHERE clause as needed to handle more complex scenarios
INSERT INTO @PerformanceBandRecordsToDelete
SELECT 
	vt.[Name] [Test Name],
	pbvt.PerformanceBandVirtualTestID,
	pbvtss.PerformanceBandVirtualTestScoreSettingID,
	pbvtss.PerformanceBandGroupID [Score PerformanceBandGroupID],
	pbvtss.Cutoffs [Score Cutoffs],
	pbvtss.ScoreType [Score ScoreType],
	pbvtsss.PerformanceBandVirtualTestSubScoreSettingID,
	pbvtsss.PerformanceBandGroupID [SubScore PerformanceBandGroupID],
	pbvtsss.Cutoffs [SubScore Cutoffs],
	pbvtsss.ScoreType [SubScore ScoreType],
	pbvtsss.SubscoreName
FROM VirtualTest vt WITH (NOLOCK)
LEFT JOIN performancebandvirtualtest pbvt WITH (NOLOCK) ON pbvt.VirtualTestID = vt.VirtualTestID
LEFT JOIN PerformanceBandVirtualTestScoreSetting pbvtss WITH (NOLOCK) ON pbvt.PerformanceBandVirtualTestID = pbvtss.PerformanceBandVirtualTestID
LEFT JOIN PerformanceBandVirtualTestSubScoreSetting pbvtsss WITH (NOLOCK) ON pbvt.PerformanceBandVirtualTestID = pbvtsss.PerformanceBandVirtualTestID
WHERE pbvt.[ID] = @DistrictID AND vt.[Name] LIKE '%'+@VirtualTestNameLike+'%'
ORDER BY vt.[Name] ASC

-- View the rows that will be deleted
SELECT * FROM @PerformanceBandRecordsToDelete

-- Delete PBVTSSS
DELETE FROM PerformanceBandVirtualTestSubScoreSetting
WHERE PerformanceBandVirtualTestSubScoreSettingID IN (
	SELECT DISTINCT PerformanceBandVirtualTestSubScoreSettingID FROM @PerformanceBandRecordsToDelete
)

-- Delete PBVTSS
DELETE FROM PerformanceBandVirtualTestScoreSetting
WHERE PerformanceBandVirtualTestScoreSettingID IN (
	SELECT DISTINCT PerformanceBandVirtualTestScoreSettingID FROM @PerformanceBandRecordsToDelete
)

-- Delete PBVT
DELETE FROM PerformanceBandVirtualTest
WHERE PerformanceBandVirtualTestID IN (
	SELECT DISTINCT PerformanceBandVirtualTestID FROM @PerformanceBandRecordsToDelete
)

ROLLBACK TRAN
