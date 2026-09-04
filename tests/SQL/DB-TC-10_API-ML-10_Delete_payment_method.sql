-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-10
-- Priority: P0
-- Layer 2 API Test: API-ML-10
-- API Test: Delete payment method
-- API Focus: Verify the payment method is removed/deactivated for the correct merchant
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Payment method deletion check

SELECT * FROM dbo.PaymentMethods WHERE id = 3;

-- EXPECTED RESULT
-- The API-deleted record is absent or has the application's inactive/deleted state.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
