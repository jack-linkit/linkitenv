
DECLARE @DuplicateStudentsList TABLE ([RowNum] INT NOT NULL PRIMARY KEY IDENTITY(1,1), [Current] INT NOT NULL,[Duplicate] INT NOT NULL)

-- all students, counting instances of AltCode within district
DECLARE @data TABLE (StudentID INT, AltCode VARCHAR(100),DistrictID INT, row_number INT, FullName varchar(200))
INSERT INTO @data
SELECT 
    StudentID,
    AltCode,
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
WHERE 
    LEN(Student.AltCode) > 0
    AND District.StateID < 75
    AND ISNUMERIC(Student.AltCode) = 1

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

insert into @DuplicateStudentsList ([Current],[Duplicate])
SELECT
    o.StudentID AS 'Orig StudentID',
    d.StudentID AS 'Dupe StudentID'
FROM 
    Originals o
JOIN
    Duplicates d
ON
    o.AltCode = d.AltCode
	and o.DistrictID = d.DistrictID
    and o.FullName = d.FullName
JOIN 
	District with (nolock)
ON
	d.DistrictID = district.DistrictID

select * from @DuplicateStudentsList
/**
Enter the Current and Duplicate student IDs into the table Duplicate Student.
Updates TestResult, Bubblesheet, ClassStudent, QTITestStudentAssignment, QTIStudentSession, SchoolStudent, and StudentProgram
with the newStudentID.
**/

--Wilson Demo: 5236
--150173

begin tran

Declare @loopCounter INT = 1, @maxCount INT

declare @duplicateStudent INT, @newStudent INT

		update Student set Status = 1 where StudentID in (select [Current] from @DuplicateStudentsList)

		select * from @DuplicateStudentsList order by [Duplicate]
		select * from TestResult with (nolock) where StudentID in (select [Duplicate] from @DuplicateStudentsList)

		PRINT 'BEGIN UPDATES'


		PRINT 'UPDATE TESTRESULT'
		Update TestResult set Testresult.StudentID = [Current] from TestResult 
		inner join @DuplicateStudentsList on [Duplicate] = TestResult.StudentID
		where TestResult.StudentID = [Duplicate]

		PRINT 'UPDATE BUBBLESHEET'
		Update BubbleSheet set StudentID = [Current] from BubbleSheet 
		inner join @DuplicateStudentsList on [Duplicate] = StudentID
		where StudentID = [Duplicate]

		PRINT 'UPDATE CLASSSTUDENT'
		Update ClassStudent set ClassStudent.StudentID = [Current] from ClassStudent 
		inner join @DuplicateStudentsList on [Duplicate] = ClassStudent.StudentID
		where ClassStudent.StudentID = [Duplicate]

		PRINT 'UPDATE QTITSA'
		Update QTITestStudentAssignment set StudentID = [Current] from QTITestStudentAssignment 
		inner join @DuplicateStudentsList on [Duplicate] = StudentID
		where StudentID = [Duplicate]

		PRINT 'UPDATE QTISS'
		Update QTIStudentSession set StudentID = [Current] from QTIStudentSession 
		inner join @DuplicateStudentsList on [Duplicate] = StudentID
		where StudentID = [Duplicate]

		PRINT 'UPDATE SCHOOLSTUDENT'
		Update SchoolStudent set StudentID = [Current] from SchoolStudent 
		inner join @DuplicateStudentsList on [Duplicate] = StudentID
		where StudentID = [Duplicate]


		PRINT 'UPDATE STUDENTPROGRAM'
		Update StudentProgram set StudentID = [Current] from StudentProgram 
		inner join @DuplicateStudentsList on [Duplicate] = StudentID
		where StudentID = [Duplicate]

		update Student set code = CONCAT('Deac-',code,': 3721' ),Status = 2,DistrictID=5236,AdminSchoolID=150173 where StudentID in (select [Duplicate] from @DuplicateStudentsList)
		update Student set Status = 2 where StudentID in (select [Duplicate] from @DuplicateStudentsList)

		PRINT 'Test Results'
		select * from TestResult with (nolock) where StudentID in (select [Current] from @DuplicateStudentsList)


--Delete from student where studentid in (select [@DuplicateStudentsList].Duplicate from @DuplicateStudentsList)



rollback tran