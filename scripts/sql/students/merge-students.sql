/**
Enter the Current and Duplicate student IDs into the table Duplicate Student.
Updates TestResult, Bubblesheet, ClassStudent, QTITestStudentAssignment, QTIStudentSession, SchoolStudent, and StudentProgram
with the newStudentID.
**/

--Wilson Demo: 5236
--150173

--begin tran

DECLARE @DuplicateStudentsList TABLE ([RowNum] INT NOT NULL PRIMARY KEY IDENTITY(1,1), [Current] INT NOT NULL,[Duplicate] INT NOT NULL)
Declare @loopCounter INT = 1, @maxCount INT

declare @duplicateStudent INT, @newStudent INT

insert into @DuplicateStudentsList ([Current],[Duplicate])
select * from (VALUES (3673095,3673578),(3674033,3678403),(3674561,3673536),(3678196,3673708),(3678216,3679425),(3678878,3679188),(3679326,3679063),(5016331,3678863),(5016417,3673319),(6320960,3673668),(6413672,5596332),(8094459,6320934),(9261228,7963850),(9261306,7963814),(9402106,8067306),
(9971165,8088247),(10490438,9261294) ) as a ([a],[b])
		--update Student set Status = 1 where StudentID in (select [Current] from @DuplicateStudentsList)

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



--rollback tran