-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-09
-- Priority: P0
-- Layer 2 API Test: API-ML-09
-- API Test: Add payment method
-- API Focus: Verify the payment method is inserted for the correct merchant
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Payment method ownership

SELECT * FROM dbo.PaymentMethods WHERE merchantId = (SELECT id FROM dbo.Merchants WHERE email='merchant@flashgateway.local');

-- EXPECTED RESULT
-- The new payment method belongs to the correct merchant.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
