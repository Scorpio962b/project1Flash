-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-025
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Verify settlement totals against merchant wallet balances

-- PURPOSE
-- Validate the relationship between settlement amounts and wallet balances without assuming an undocumented accounting rule.

-- SQL
SELECT
    m.id,
    m.merchantName,
    m.walletBalance,
    ROUND(COALESCE(SUM(s.amount),0),2) AS settlementTotal
FROM dbo.Merchants m
LEFT JOIN dbo.Settlements s ON s.merchantId = m.id
GROUP BY m.id, m.merchantName, m.walletBalance
ORDER BY m.id;

-- EXPECTED RESULT
-- The resulting values are compared with the approved business rule for whether settlements reduce wallet balance.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
