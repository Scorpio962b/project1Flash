-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-036
-- Test Group: Data Hygiene & Constraints
-- Priority: P1
-- Scenario: Check invalid merchant statuses

-- PURPOSE
-- Detect unsupported merchant status values.

-- SQL
SELECT DISTINCT status
FROM dbo.Merchants
WHERE status IS NULL
   OR LOWER(status) NOT IN ('active','inactive');

-- EXPECTED RESULT
-- 0 rows are returned if these are the only allowed statuses in the application.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
