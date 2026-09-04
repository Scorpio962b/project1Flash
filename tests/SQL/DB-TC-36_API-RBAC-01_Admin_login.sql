-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-36
-- Priority: P1
-- Layer 2 API Test: API-RBAC-01
-- API Test: Admin login
-- API Focus: Verify the admin account exists with role=admin
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Admin role integrity

SELECT id,email,role,status FROM dbo.Merchants WHERE role='admin';

-- EXPECTED RESULT
-- Admin account exists with role=admin.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
