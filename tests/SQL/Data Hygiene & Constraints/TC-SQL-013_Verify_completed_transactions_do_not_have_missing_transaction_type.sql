-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-013
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Verify completed transactions do not have missing transaction type

-- PURPOSE
-- Ensure completed financial actions are classified.

-- SQL
SELECT *
FROM dbo.WalletTransactions
WHERE status = 'completed'
  AND transactionType IS NULL;

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
