-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-011
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Verify duplicate wallet transaction signatures are absent

-- PURPOSE
-- Detect repeated ledger actions that may represent double processing.

-- SQL
SELECT merchantId, amount, transactionType, serviceType, status, reference, COUNT(*) AS duplicateCount
FROM dbo.WalletTransactions
GROUP BY merchantId, amount, transactionType, serviceType, status, reference
HAVING COUNT(*) > 1;

-- EXPECTED RESULT
-- 0 rows are returned unless duplicates are explicitly allowed by the business rules.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
