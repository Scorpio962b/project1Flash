-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-050
-- Test Group: Business Intelligence Reports
-- Priority: P2
-- Scenario: Create a combined merchant financial performance report

-- PURPOSE
-- Final management-level financial/BI report combining merchant, wallet and settlement information.

-- SQL
SELECT
    m.id,
    m.merchantName,
    m.status,
    m.walletBalance,
    COUNT(DISTINCT wt.id) AS transactionCount,
    ROUND(COALESCE(SUM(CASE WHEN wt.status='completed' THEN wt.amount ELSE 0 END),0),2) AS completedTransactionValue,
    COUNT(DISTINCT s.id) AS settlementCount,
    ROUND(COALESCE(SUM(s.amount),0),2) AS settlementTotal
FROM dbo.Merchants m
LEFT JOIN dbo.WalletTransactions wt ON wt.merchantId = m.id
LEFT JOIN dbo.Settlements s ON s.merchantId = m.id
GROUP BY m.id, m.merchantName, m.status, m.walletBalance
ORDER BY completedTransactionValue DESC, settlementTotal DESC;

-- EXPECTED RESULT
-- Each merchant appears once, with correctly calculated transaction and settlement totals. COUNT(DISTINCT) prevents the two joins from multiplying amounts.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
