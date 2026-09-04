-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-002
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Verify every wallet transaction is linked to an existing merchant

-- PURPOSE
-- Detect wallet transactions belonging to non-existent merchants.

-- SQL
SELECT wt.*
FROM dbo.WalletTransactions wt
LEFT JOIN dbo.Merchants m ON m.id = wt.merchantId
WHERE m.id IS NULL;

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
