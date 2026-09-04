-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-007
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Verify settlement amounts are positive

-- PURPOSE
-- Detect invalid settlement values.

-- SQL
SELECT *
FROM dbo.Settlements
WHERE amount IS NULL OR amount <= 0;

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
