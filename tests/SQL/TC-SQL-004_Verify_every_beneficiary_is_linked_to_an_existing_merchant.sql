-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-004
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Verify every beneficiary is linked to an existing merchant

-- PURPOSE
-- Detect beneficiary records belonging to missing merchants.

-- SQL
SELECT b.*
FROM dbo.Beneficiaries b
LEFT JOIN dbo.Merchants m ON m.id = b.merchantId
WHERE m.id IS NULL;

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
