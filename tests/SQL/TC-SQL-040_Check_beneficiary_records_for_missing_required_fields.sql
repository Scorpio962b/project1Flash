-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-040
-- Test Group: Data Hygiene & Constraints
-- Priority: P1
-- Scenario: Check beneficiary records for missing required fields

-- PURPOSE
-- Detect incomplete beneficiary records.

-- SQL
SELECT *
FROM dbo.Beneficiaries
WHERE beneficiaryName IS NULL OR LTRIM(RTRIM(beneficiaryName)) = ''
   OR bank IS NULL OR LTRIM(RTRIM(bank)) = ''
   OR accountNumber IS NULL OR LTRIM(RTRIM(accountNumber)) = '';

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
