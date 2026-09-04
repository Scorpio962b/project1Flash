-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-035
-- Test Group: Data Hygiene & Constraints
-- Priority: P1
-- Scenario: Check invalid merchant roles

-- PURPOSE
-- Verify role values follow the project's known seed values.

-- SQL
SELECT DISTINCT role
FROM dbo.Merchants
WHERE role IS NULL
   OR LOWER(role) NOT IN ('merchant','admin');

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
