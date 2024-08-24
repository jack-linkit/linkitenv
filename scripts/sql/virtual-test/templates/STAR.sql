declare @districtid INT = 0000;

WITH tt
AS (
	SELECT DISTINCT vt.VirtualTestID AS [VTID],
		vt.[Name],
		[vv].[VirtualTest_VirtualTestCustomScore],
		[vv].[VirtualTestID],
		[vv].[VirtualTestCustomScoreID],
		CASE 
			WHEN vt.name LIKE '%Math%'
				THEN 'Math'
			WHEN vt.name LIKE '%ELA%'
				AND vt.name NOT LIKE '%early lit%'
				THEN 'ELA'
			ELSE 'Early Literacy Integrations'
			END AS 'Template Type'
	FROM TestResult tr WITH (NOLOCK)
	JOIN VirtualTest vt WITH (NOLOCK) ON vt.VirtualTestID = tr.VirtualTestID and vt.[Name] like '2023-24%'
	JOIN DataSetCategory dsc WITH (NOLOCK) ON dsc.DataSetCategoryID = vt.DataSetCategoryID
		AND dsc.DataSetCategoryName like 'star [bpe]%'
	JOIN Bank b WITH (NOLOCK) ON b.BankID = vt.BankID
	JOIN [Subject] sub WITH (NOLOCK) ON sub.SubjectID = b.SubjectID
	LEFT JOIN VirtualTest_VirtualTestCustomScore vv WITH (NOLOCK) ON vv.VirtualTestID = vt.VirtualTestID
	WHERE tr.DistrictID = @districtid
	),
TEMP
AS (
	SELECT TRIM(SUBSTRING(Name, CHARINDEX('Star', Name) + len('Star'),CHARINDEX(' (Master)',Name)-(CHARINDEX('Star',Name)+LEN('Star')))) AS [Template Type],
		VirtualTestCustomScoreID,
		[Name] AS [Template Name]
	FROM VirtualTestCustomScore WITH (NOLOCK)
	WHERE virtualtestcustomscoreid IN (
			15302, 15303, 20231
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