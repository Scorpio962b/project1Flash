-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-016
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Verify settlement amount equals the stored settlement amount

-- PURPOSE
-- Verify settlement amounts use two-decimal monetary precision.

-- SQL
SELECT id, merchantId, amount
FROM dbo.Settlements
WHERE amount <> ROUND(amount,2);

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
