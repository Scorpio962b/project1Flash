-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-01
-- Priority: P0
-- Layer 2 API Test: API-ML-01
-- API Test: Register merchant / user
-- API Focus: Verify registered merchant is stored in dbo.Merchants
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Verify registered merchant is stored

SELECT * FROM dbo.Merchants WHERE email = 'billing@swiftcommerce.local';

-- EXPECTED RESULT
-- A matching merchant row exists with the expected identity data.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
