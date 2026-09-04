-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-034
-- Test Group: Data Hygiene & Constraints
-- Priority: P1
-- Scenario: Check invalid merchant wallet balances

-- PURPOSE
-- Detect invalid wallet balances.

-- SQL
SELECT *
FROM dbo.Merchants
WHERE walletBalance IS NULL OR walletBalance < 0;

-- EXPECTED RESULT
-- 0 rows are returned unless negative balances are explicitly supported.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
