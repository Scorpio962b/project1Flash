-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-13
-- Priority: P0
-- Layer 2 API Test: API-ML-13
-- API Test: Merchant status / active-state validation
-- API Focus: Verify active/inactive status is stored correctly
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Merchant active state

SELECT id, merchantName, status FROM dbo.Merchants ORDER BY id;

-- EXPECTED RESULT
-- Merchant lifecycle status matches the API result.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
