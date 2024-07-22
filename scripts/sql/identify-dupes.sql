/* Script to identify pairs of duplicate students (AltCode) */
DECLARE @DistrictID int = 4760

DECLARE @data TABLE (StudentID INT, AltCode VARCHAR(100),/*DistrictID INT,*/ row_number INT, FullName varchar(200))
INSERT INTO @data
SELECT 
    StudentID,
    AltCode,
    -- Student.DistrictID,
    ROW_NUMBER() OVER (PARTITION BY /*Student.DistrictID,*/ AltCode ORDER BY StudentID),
    FullName
FROM
    Student WITH (NOLOCK)
-- JOIN
--     District WITH (NOLOCK)
-- ON
    -- Student.DistrictID = District.DistrictID
WHERE 
    LEN(Student.AltCode) > 0
    -- AND District.StateID < 75
    AND ISNUMERIC(Student.AltCode) = 1
    AND Student.DistrictID = @DistrictID

;WITH Originals AS (
    SELECT 
        StudentID,
        AltCode,
        FullName
        -- DistrictID
    FROM 
        @data
    WHERE row_number = 1
),
Duplicates AS (
    SELECT 
        StudentID,
        AltCode,
        FullName
        -- DistrictID
    FROM 
        @data
    WHERE row_number > 1
)

SELECT
    o.StudentID AS 'Orig StudentID',
    o.FullName, 
    d.StudentID AS 'Dupe StudentID',
    d.FullName,
    o.AltCode
FROM 
    Originals o
JOIN
    Duplicates d
ON
    o.AltCode = d.AltCode
    -- and o.FullName != d.FullName