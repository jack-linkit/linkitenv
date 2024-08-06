## Duplicate Students Proposal

### Step 1: Identifying Duplicate Students
#### Obvious case (s1.Code = s2.Code OR s1.AltCode = s2.AltCode): 
- multiple Students within the same District have the same local ID (Code) or the same state ID (AltCode)

#### Data Upload case (s1.AltCode = s2.Code):
- a Student has a state ID (AltCode) equal to the local ID (Code) of another Student
    - Cause: DA uploads state data with creation of new students with the required local ID (Code) as the state ID (ex. PASecureID)
- Issue: we don't receive an error since the duplicate codes are in different columns

### Step 2: Resolving Duplicate Students

1. **Duplicates with an exact match in FullName**
    - 48,628 out of 57,239 duplicates found in ARAnalysis from the data upload case were an exact match (case-insensitive) on the FullName field (85%)
    - 13,798 have duplicate Code, 13,508 of these have an exact match on FullName
    - 581,134 have duplicate AltCode, 60,909 of these have an exact match on FullName
    - *These can be confidently fixed in mass, don't need to hard-code any values in the procedure (123,045 total)*
2. **The other 8611 results in data upload case need to be resolved manually**
    - 3722 are off by just 1 or two characters (4889 remain)
    - 2532 have at least 1 whole word that matches (2357 remain)
    - 874 have a local ID of 0 AND a state ID of 0 (1483 remain)
3. **If they do no already, DA should have the ability to upload without a local ID (Code) and use state ID (AltCode) only instead**
    - Roster sync should also be throwing an error if a student already exists with a given AltCode
    - Should prevent duplicates in the (s1.AltCode = s2.Code) case
- Add Error/Warning for s1.AltCode = s2.Code ? 


- 6,040,120 students total in DB
