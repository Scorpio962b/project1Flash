-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-038
-- Test Group: Data Hygiene & Constraints
-- Priority: P1
-- Scenario: Check duplicate product names

-- PURPOSE
-- Prevent duplicate product definitions.

-- SQL
SELECT name, COUNT(*) AS duplicateCount
FROM dbo.Products
GROUP BY name
HAVING COUNT(*) > 1;

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
