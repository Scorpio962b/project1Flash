-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-05
-- Priority: P0
-- Layer 2 API Test: API-ML-05
-- API Test: Valid merchant login
-- API Focus: Verify the login account maps to an active merchant
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Active merchant for login

SELECT id, merchantName, email, role, status FROM dbo.Merchants WHERE email='merchant@flashgateway.local';

-- EXPECTED RESULT
-- The login account maps to an active merchant with the correct role.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
