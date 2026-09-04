-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-08
-- Priority: P0
-- Layer 2 API Test: API-ML-08
-- API Test: List payment methods
-- API Focus: Verify API payment methods belong to the requested merchant
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Payment methods for merchant

SELECT pm.* FROM dbo.PaymentMethods pm JOIN dbo.Merchants m ON m.id=pm.merchantId WHERE m.email='merchant@flashgateway.local';

-- EXPECTED RESULT
-- Only that merchant's payment methods are returned.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
