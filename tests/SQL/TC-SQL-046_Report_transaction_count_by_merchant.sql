-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-046
-- Test Group: Business Intelligence Reports
-- Priority: P2
-- Scenario: Report transaction count by merchant

-- PURPOSE
-- Identify merchants with the highest activity.

-- SQL
SELECT
    m.id,
    m.merchantName,
    COUNT(wt.merchantId) AS transactionCount
FROM dbo.Merchants m
LEFT JOIN dbo.WalletTransactions wt ON wt.merchantId = m.id
GROUP BY m.id, m.merchantName
ORDER BY transactionCount DESC;

-- EXPECTED RESULT
-- Merchants are ranked correctly by transaction count.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
