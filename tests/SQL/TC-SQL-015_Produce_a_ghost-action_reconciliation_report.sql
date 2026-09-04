-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-015
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Produce a ghost-action reconciliation report

-- PURPOSE
-- Single audit query for unlinked/ghost records across the supplied financial-supporting tables.

-- SQL
SELECT 'Settlement' AS sourceTable, s.merchantId AS merchantId
FROM dbo.Settlements s
LEFT JOIN dbo.Merchants m ON m.id = s.merchantId
WHERE m.id IS NULL
UNION ALL
SELECT 'WalletTransaction', wt.merchantId
FROM dbo.WalletTransactions wt
LEFT JOIN dbo.Merchants m ON m.id = wt.merchantId
WHERE m.id IS NULL
UNION ALL
SELECT 'PaymentMethod', pm.merchantId
FROM dbo.PaymentMethods pm
LEFT JOIN dbo.Merchants m ON m.id = pm.merchantId
WHERE m.id IS NULL
UNION ALL
SELECT 'Beneficiary', b.merchantId
FROM dbo.Beneficiaries b
LEFT JOIN dbo.Merchants m ON m.id = b.merchantId
WHERE m.id IS NULL;

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
