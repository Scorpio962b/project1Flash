-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-047
-- Test Group: Business Intelligence Reports
-- Priority: P2
-- Scenario: Report settlement totals by merchant

-- PURPOSE
-- Identify merchants receiving the highest settlement values.

-- SQL
SELECT
    m.id,
    m.merchantName,
    ROUND(COALESCE(SUM(s.amount),0),2) AS settlementTotal
FROM dbo.Merchants m
LEFT JOIN dbo.Settlements s ON s.merchantId = m.id
GROUP BY m.id, m.merchantName
ORDER BY settlementTotal DESC;

-- EXPECTED RESULT
-- Merchants are ranked correctly by total settlement value.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
