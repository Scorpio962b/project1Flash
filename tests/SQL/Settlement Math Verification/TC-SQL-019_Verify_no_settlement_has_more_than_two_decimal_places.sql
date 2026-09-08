-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-019
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Verify no settlement has more than two decimal places

-- PURPOSE
-- Detect monetary precision errors.

-- SQL
SELECT *
FROM dbo.Settlements
WHERE amount * 100 <> ROUND(amount * 100,0);

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
