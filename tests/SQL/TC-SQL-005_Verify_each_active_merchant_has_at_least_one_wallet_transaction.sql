-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-005
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Verify each active merchant has at least one wallet transaction

-- PURPOSE
-- Find active merchants with no financial activity.

-- SQL
SELECT m.id, m.merchantName
FROM dbo.Merchants m
LEFT JOIN dbo.WalletTransactions wt ON wt.merchantId = m.id
WHERE m.status = 'active'
GROUP BY m.id, m.merchantName
HAVING COUNT(wt.merchantId) = 0;

-- EXPECTED RESULT
-- 0 rows are returned for active merchants expected to participate in wallet activity.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
