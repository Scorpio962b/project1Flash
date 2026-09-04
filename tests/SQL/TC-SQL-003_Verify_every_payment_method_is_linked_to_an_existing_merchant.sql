-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-003
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Verify every payment method is linked to an existing merchant

-- PURPOSE
-- Detect payment methods with invalid merchant references.

-- SQL
SELECT pm.*
FROM dbo.PaymentMethods pm
LEFT JOIN dbo.Merchants m ON m.id = pm.merchantId
WHERE m.id IS NULL;

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
