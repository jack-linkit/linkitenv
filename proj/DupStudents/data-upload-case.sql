/* 
    Case: AltCode matches LocalID of another Student in same district
*/
SELECT 
    d.Name AS 'District',
    d.DistrictID,
    s1.FullName AS 'Original Name',
    s2.FullName AS 'Duplicate Name',
    s1.StudentID AS 'Original StudentID',
    s1.Code AS 'Original Local ID (Code)',
    s1.AltCode AS 'Original StateID (AltCode)',
    s2.Studentid AS 'Duplicate StudentID',
    s2.Code AS 'Duplicate Local ID (Code)',
    s2.AltCode AS 'Duplicate StateID (AltCode)'
FROM 
    Student s1 WITH (NOLOCK)
JOIN 
    Student s2 WITH (NOLOCK)
ON
    s1.DistrictID = s2.DistrictID
    AND s1.AltCode = s2.Code
    AND s1.Studentid != s2.StudentID
    -- AND s1.FullName = s2.FullName
JOIN 
    District d with (nolock) on s1.DistrictID = d.DistrictID
WHERE 
    LEN(s1.AltCode) > 0
    AND LEN(s2.Code) > 0
    AND d.StateID < 75
ORDER BY 
    s1.DistrictID ASC,
    s1.FullName ASC



/* 
    Case: Code or AltCode duplicate
*/
SELECT 
    d.Name AS 'District',
    d.DistrictID,
    s1.FullName AS 'Original Name',
    s2.FullName AS 'Duplicate Name',
    s1.StudentID AS 'Original StudentID',
    s1.Code AS 'Original Local ID (Code)',
    s1.AltCode AS 'Original StateID (AltCode)',
    s2.Studentid AS 'Duplicate StudentID',
    s2.Code AS 'Duplicate Local ID (Code)',
    s2.AltCode AS 'Duplicate StateID (AltCode)'
FROM 
    Student s1 WITH (NOLOCK)
JOIN 
    Student s2 WITH (NOLOCK)
ON
    s1.DistrictID = s2.DistrictID
    AND (s1.AltCode = s2.AltCode)
    AND s1.Studentid != s2.StudentID
    AND s1.FullName = s2.FullName
JOIN 
    District d WITH (NOLOCK) ON s1.DistrictID = d.DistrictID
WHERE 
    LEN(s1.AltCode) > 0
    AND LEN(s2.Code) > 0
    AND d.StateID < 75
    AND ISNUMERIC(s1.AltCode) = 1
ORDER BY 
    s1.DistrictID ASC,
    s1.FullName ASC


select count(*) from student with (nolock)