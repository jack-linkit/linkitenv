/* Script to identify pairs of duplicate students (AltCode) */
DECLARE @DistrictID int = 4760;

WITH StudentData AS (
    SELECT 
        StudentID,
        AltCode,
        FullName,
        Student.DistrictID,
        ROW_NUMBER() OVER (
            PARTITION BY Student.DistrictID, AltCode 
            ORDER BY CASE WHEN ModifiedUser = 2 THEN 0 ELSE 1 END, StudentID
        ) AS RowNum
    FROM 
        Student WITH (NOLOCK)
    JOIN 
        District WITH (NOLOCK) ON Student.DistrictID = District.DistrictID
    JOIN 
        DistrictMeta WITH (NOLOCK) ON District.DistrictID = DistrictMeta.DistrictID 
        AND DistrictMeta.Name = 'DistrictType' AND DistrictMeta.Data = 'DTS'
    WHERE 
        LEN(Student.AltCode) > 1
        AND District.StateID < 75
        AND ISNUMERIC(Student.AltCode) = 1
        AND Student.DistrictID = @DistrictID
        AND REPLACE(AltCode, '0', '') <> ''
),
Originals AS (
    SELECT 
        StudentID, AltCode, FullName, DistrictID
    FROM 
        StudentData
    WHERE 
        RowNum = 1
),
Duplicates AS (
    SELECT 
        StudentID, AltCode, FullName, DistrictID
    FROM 
        StudentData
    WHERE 
        RowNum > 1
)
-- Fetch duplicates only
SELECT
    o.StudentID AS 'Orig StudentID',
    o.FullName AS 'Orig FullName',
    d.StudentID AS 'Dupe StudentID',
    d.FullName AS 'Dupe FullName',
    o.AltCode,
    dist.Name AS DistrictName
FROM 
    Originals o
JOIN 
    Duplicates d ON o.AltCode = d.AltCode AND o.DistrictID = d.DistrictID
JOIN 
    District dist WITH (NOLOCK) ON o.DistrictID = dist.DistrictID;

