/* Script to identify pairs of duplicate students (AltCode) */
-- DECLARE @DistrictID int = 4760

-- all students in district, counting instances of AltCode
DECLARE @data TABLE (StudentID INT, AltCode VARCHAR(100),DistrictID INT, row_number INT, FullName varchar(200))
INSERT INTO @data
SELECT 
    StudentID,
    AltCode,
    Student.DistrictID,
    ROW_NUMBER() OVER (PARTITION BY Student.DistrictID, AltCode ORDER BY CASE WHEN ModifiedUser = 2 THEN 0 ELSE 1 END, StudentID), -- prefer roster loaded students
    FullName
FROM
    Student WITH (NOLOCK)
JOIN
    District WITH (NOLOCK)
ON
    Student.DistrictID = District.DistrictID
WHERE 
    LEN(Student.AltCode) > 0
    AND District.StateID < 75
    AND ISNUMERIC(Student.AltCode) = 1
    -- AND Student.DistrictID = @DistrictID

;WITH Originals AS (
    SELECT 
        StudentID,
        AltCode,
        FullName,
        DistrictID
    FROM 
        @data
    WHERE row_number = 1
),
Duplicates AS (
    SELECT 
        StudentID,
        AltCode,
        FullName,
        DistrictID
    FROM 
        @data
    WHERE row_number > 1
)

-- duplicates only
SELECT
    o.StudentID AS 'Orig StudentID',
    o.FullName, 
    d.StudentID AS 'Dupe StudentID',
    d.FullName,
    o.AltCode,
	district.Name
FROM 
    Originals o
JOIN
    Duplicates d
ON
    o.AltCode = d.AltCode
	and o.DistrictID = d.DistrictID
    -- and o.FullName != d.FullName
JOIN 
	District with (nolock)
ON
	d.DistrictID = district.DistrictID
