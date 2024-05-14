declare @districtid INT = 6335;

WITH tt
AS (
	SELECT DISTINCT vt.VirtualTestID AS [VTID],
		vt.[Name],
		[vv].[VirtualTest_VirtualTestCustomScore],
		[vv].[VirtualTestID],
		[vv].[VirtualTestCustomScoreID],
		CASE 
			WHEN vt.name LIKE '%lang%use%'
				THEN 'Language Usage'
			WHEN vt.name LIKE '%ELA%'
				AND vt.name NOT LIKE '%lang%use%'
				THEN 'Reading'
			ELSE sub.Name
			END AS 'Template Type'
	FROM TestResult tr WITH (NOLOCK)
	JOIN VirtualTest vt WITH (NOLOCK) ON vt.VirtualTestID = tr.VirtualTestID
	JOIN DataSetCategory dsc WITH (NOLOCK) ON dsc.DataSetCategoryID = vt.DataSetCategoryID
		AND dsc.DataSetCategoryID = 59
	JOIN Bank b WITH (NOLOCK) ON b.BankID = vt.BankID
	JOIN [Subject] sub WITH (NOLOCK) ON sub.SubjectID = b.SubjectID
	LEFT JOIN VirtualTest_VirtualTestCustomScore vv WITH (NOLOCK) ON vv.VirtualTestID = vt.VirtualTestID
	WHERE tr.DistrictID = @districtid
	),
TEMP
AS (
	SELECT TRIM(SUBSTRING(Name, CHARINDEX('NWEA MAP', Name) + len('NWEA MAP'),CHARINDEX(' (Master)',Name)-(CHARINDEX('NWEA MAP',Name)+LEN('NWEA MAP')))) AS [Template Type],
		VirtualTestCustomScoreID,
		[Name] AS [Template Name]
	FROM VirtualTestCustomScore WITH (NOLOCK)
	WHERE virtualtestcustomscoreid IN (
			1351, 1352, 1353, 1354
			)
	)
SELECT [TEMP].[Template Type],
	[TEMP].[VirtualTestCustomScoreID],
	[TEMP].[Template Name],
	[tt].[VTID],
	[tt].[Name],
	[tt].[VirtualTest_VirtualTestCustomScore],
	[tt].[VirtualTestID],
	[tt].[VirtualTestCustomScoreID],
	[tt].[Template Type],
	CASE 
		WHEN tt.VirtualTest_VirtualTestCustomScore IS NULL
			THEN CONCAT (
					'(',
					tt.VTID,
					',',
					TEMP.VirtualTestCustomScoreID,
					')'
					)
		ELSE ''
		END AS [Update]
FROM tt
JOIN TEMP ON tt.[Template Type] = TEMP.[Template Type]

/*

INSERT INTO VirtualTest_VirtualTestCustomScore (VirtualTestID, VirtualTestCustomScoreID)
VALUES


*/