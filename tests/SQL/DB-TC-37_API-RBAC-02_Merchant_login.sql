-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-37
-- Priority: P1
-- Layer 2 API Test: API-RBAC-02
-- API Test: Merchant login
-- API Focus: Verify the merchant account exists with role=merchant
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Merchant role integrity

SELECT id,email,role,status FROM dbo.Merchants WHERE role='merchant';

-- EXPECTED RESULT
-- Merchant account exists with role=merchant.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
