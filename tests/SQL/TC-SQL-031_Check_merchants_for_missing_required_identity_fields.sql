-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-031
-- Test Group: Data Hygiene & Constraints
-- Priority: P1
-- Scenario: Check merchants for missing required identity fields

-- PURPOSE
-- Detect missing merchant identity data.

-- SQL
SELECT *
FROM dbo.Merchants
WHERE merchantName IS NULL OR LTRIM(RTRIM(merchantName)) = ''
   OR email IS NULL OR LTRIM(RTRIM(email)) = ''
   OR role IS NULL OR LTRIM(RTRIM(role)) = '';

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
