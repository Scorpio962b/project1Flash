-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-049
-- Test Group: Business Intelligence Reports
-- Priority: P2
-- Scenario: Report merchant wallet balances from highest to lowest

-- PURPOSE
-- Support financial health and merchant performance reporting.

-- SQL
SELECT id, merchantName, walletBalance, status
FROM dbo.Merchants
ORDER BY walletBalance DESC;

-- EXPECTED RESULT
-- Merchants are correctly ranked by wallet balance.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
