declare @districtid INT = 6526;

WITH tt
AS (
	SELECT DISTINCT vt.VirtualTestID AS [VTID],
		vt.[Name],
		[vv].[VirtualTest_VirtualTestCustomScore],
		[vv].[VirtualTestID],
		[vv].[VirtualTestCustomScoreID],
		CASE 
			WHEN vt.name LIKE '%ELA%'
				THEN 'ELA'
			ELSE sub.Name
			END AS 'Template Type'
	FROM TestResult tr WITH (NOLOCK)
	JOIN VirtualTest vt WITH (NOLOCK) ON vt.VirtualTestID = tr.VirtualTestID
	JOIN DataSetCategory dsc WITH (NOLOCK) ON dsc.DataSetCategoryID = vt.DataSetCategoryID
		AND dsc.DataSetCategoryID = 38
	JOIN Bank b WITH (NOLOCK) ON b.BankID = vt.BankID
	JOIN [Subject] sub WITH (NOLOCK) ON sub.SubjectID = b.SubjectID
	LEFT JOIN VirtualTest_VirtualTestCustomScore vv WITH (NOLOCK) ON vv.VirtualTestID = vt.VirtualTestID
	WHERE tr.DistrictID = @districtid
	),
TEMP
AS (
	SELECT TRIM(SUBSTRING(Name, CHARINDEX('I-Ready', Name) + len('I-Ready'),CHARINDEX(' (Master)',Name)-(CHARINDEX('I-Ready',Name)+LEN('I-Ready')))) AS [Template Type],
		VirtualTestCustomScoreID,
		[Name] AS [Template Name]
	FROM VirtualTestCustomScore WITH (NOLOCK)
	WHERE virtualtestcustomscoreid IN ( 16636,16637)
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