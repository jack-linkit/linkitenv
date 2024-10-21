
DECLARE @DuplicateStudentsList TABLE ([RowNum] INT NOT NULL PRIMARY KEY IDENTITY(1,1), [Current] INT NOT NULL,[Duplicate] INT NOT NULL)

declare @districtid int = 4760

-- all students, counting instances of AltCode within district
DECLARE @data TABLE (StudentID INT, AltCode VARCHAR(100), FirstName varchar(100), LastName varchar(100), DistrictID INT, row_number INT, FullName varchar(200))
INSERT INTO @data
SELECT 
    StudentID,
    AltCode,
    FirstName, 
    LastName,
    Student.DistrictID,
    ROW_NUMBER() OVER (PARTITION BY Student.DistrictID, AltCode ORDER BY CASE WHEN ModifiedBy = 'RosterLoader' THEN 0 ELSE 1 END, ModifiedDate DESC, StudentID DESC), -- prefer roster loaded students
    FullName
FROM
    Student WITH (NOLOCK)
JOIN
    District WITH (NOLOCK)
ON
    Student.DistrictID = District.DistrictID
JOIN
    DistrictMeta with (nolock)
ON 
    District.DistrictID = DistrictMeta.DistrictID
    AND DistrictMeta.Name = 'DistrictType'
    AND DistrictMeta.Data = 'DTS'
    and District.DistrictID = @districtid
WHERE 
    LEN(Student.AltCode) > 1 -- real AltCode value
    AND District.StateID < 75 
    AND ISNUMERIC(Student.AltCode) = 1 -- numeric value
    AND NOT (
        Student.AltCode like '0%'
        AND Student.AltCode not like '%[^0]%' -- not all zeros
    )


;WITH Originals AS (
    SELECT 
        StudentID,
        AltCode,
        FullName,
        DistrictID,
        FirstName,
        LastName
    FROM 
        @data
    WHERE row_number = 1
),
Duplicates AS (
    SELECT 
        StudentID,
        AltCode,
        FullName,
        DistrictID,
        FirstName,
        LastName
    FROM 
        @data
    WHERE row_number > 1
)

-- duplicates only

-- insert into @DuplicateStudentsList ([Current],[Duplicate])
SELECT
    o.StudentID AS 'Orig StudentID',
    o.FullName, 
    d.StudentID AS 'Dupe StudentID',
    d.FullName,
    o.AltCode,
    district.Name,
    s.Code
FROM 
    Originals o
JOIN
    Duplicates d
ON
    o.AltCode = d.AltCode
	and o.DistrictID = d.DistrictID
    and o.FullName != d.FullName
JOIN 
	District with (nolock)
ON
	d.DistrictID = district.DistrictID
JOIN
    Student s with (nolock)
ON
    d.StudentID = s.StudentID
