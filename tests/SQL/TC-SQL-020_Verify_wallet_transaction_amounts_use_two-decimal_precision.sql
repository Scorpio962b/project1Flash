-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-020
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Verify wallet transaction amounts use two-decimal precision

-- PURPOSE
-- Prevent precision problems in ledger calculations.

-- SQL
SELECT *
FROM dbo.WalletTransactions
WHERE amount * 100 <> ROUND(amount * 100,0);

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
