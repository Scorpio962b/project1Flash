-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-027
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Verify settlement amounts are numeric and finite

-- PURPOSE
-- Detect values that cannot be safely interpreted as monetary amounts.

-- SQL
SELECT *
FROM dbo.Settlements
WHERE TRY_CONVERT(decimal(18,2), amount) IS NULL;

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
