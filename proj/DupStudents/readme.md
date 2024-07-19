## Duplicate Students Proposal

### Step 1: Identifying Duplicate Students
Obvious case (s1.Code = s2.Code OR s1.AltCode = s2.AltCode): 
    - multiple Students within the same District have the same local ID (Code) or the same state ID (AltCode)

Data Upload case (s1.AltCode = s2.Code):
    - a Student has a state ID (AltCode) equal to the local ID (Code) of another Student
        - Cause: DA uploads state data with creation of new students with the required local ID (Code) as the state ID (ex. PASecureID)

### Step 2: Resolving Duplicate Students
    1. 48628 out of 57239 duplicates found in ARAnalysis from the data upload case were an exact match (case-insensitive) on the FullName field (85%)
        - These can be confidently fixed in mass, don't need to hard-code any values in the procedure
    2. If they do no already, DA should have the ability to upload without a local ID (Code) and use state ID (AltCode) only instead
        - Roster sync should also be throwing an error if a student already exists with a given AltCode
    3. The other 8611 results need to be resolved manually
        - 3722 are off by just 1 or two characters (4889 remain)
        - 2532 have at least 1 whole word that matches (2357 remain)
        - 874 have a local ID of 0 and a state ID of 8 (1483 remain)
    - Add Error/Warning for s1.AltCode = s2.Code ? 
    - 13798 have duplicate Code, 13508 of these have an exact match on FullName
    - 581134 have duplicate AltCodes 60909 of these have an exact match on FullName


    - 6040120 students total
