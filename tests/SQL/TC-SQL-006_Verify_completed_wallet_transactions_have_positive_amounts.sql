-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-006
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Verify completed wallet transactions have positive amounts

-- PURPOSE
-- Prevent invalid completed financial transactions.

-- SQL
SELECT *
FROM dbo.WalletTransactions
WHERE status = 'completed'
  AND (amount IS NULL OR amount <= 0);

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
