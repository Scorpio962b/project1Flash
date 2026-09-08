-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-017
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Calculate total settlement value

-- PURPOSE
-- Validate the overall settlement total.

-- SQL
SELECT ROUND(COALESCE(SUM(amount),0),2) AS totalSettlementValue
FROM dbo.Settlements;

-- EXPECTED RESULT
-- The result equals the approved total settlement value for the test dataset.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
