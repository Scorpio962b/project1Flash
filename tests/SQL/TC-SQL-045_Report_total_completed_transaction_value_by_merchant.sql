-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-045
-- Test Group: Business Intelligence Reports
-- Priority: P2
-- Scenario: Report total completed transaction value by merchant

-- PURPOSE
-- Identify financially active/high-value merchants.

-- SQL
SELECT
    m.id,
    m.merchantName,
    ROUND(COALESCE(SUM(CASE WHEN wt.status='completed' THEN wt.amount ELSE 0 END),0),2) AS completedTransactionValue
FROM dbo.Merchants m
LEFT JOIN dbo.WalletTransactions wt ON wt.merchantId = m.id
GROUP BY m.id, m.merchantName
ORDER BY completedTransactionValue DESC;

-- EXPECTED RESULT
-- Merchants are ranked correctly by completed transaction value.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
