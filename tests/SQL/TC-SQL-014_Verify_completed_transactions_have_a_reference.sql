-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-014
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Verify completed transactions have a reference

-- PURPOSE
-- Ensure completed ledger actions can be traced/audited.

-- SQL
SELECT *
FROM dbo.WalletTransactions
WHERE status = 'completed'
  AND (reference IS NULL OR LTRIM(RTRIM(reference)) = '');

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
