-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-009
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Verify settlement totals by merchant

-- PURPOSE
-- Create a merchant-level settlement reconciliation view.

-- SQL
SELECT
    m.id,
    m.merchantName,
    COUNT(s.merchantId) AS settlementCount,
    COALESCE(SUM(s.amount),0) AS settlementTotal
FROM dbo.Merchants m
LEFT JOIN dbo.Settlements s ON s.merchantId = m.id
GROUP BY m.id, m.merchantName
ORDER BY m.id;

-- EXPECTED RESULT
-- Every settlement total is attached to the correct merchant and no orphan merchantId exists.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
