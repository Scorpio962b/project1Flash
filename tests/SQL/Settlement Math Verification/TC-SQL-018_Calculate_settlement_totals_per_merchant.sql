-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-018
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Calculate settlement totals per merchant

-- PURPOSE
-- Validate merchant-level settlement arithmetic.

-- SQL
SELECT merchantId, ROUND(SUM(amount),2) AS merchantSettlementTotal
FROM dbo.Settlements
GROUP BY merchantId
ORDER BY merchantId;

-- EXPECTED RESULT
-- Each total matches the expected settlement total for that merchant.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
