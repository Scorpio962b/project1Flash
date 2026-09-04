-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-41
-- Priority: P1
-- Layer 2 API Test: API-RBAC-06
-- API Test: Admin access to settlement data
-- API Focus: Verify admin settlement records are correctly linked
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Admin settlement access

SELECT s.*,m.email,m.role FROM dbo.Settlements s JOIN dbo.Merchants m ON m.id=s.merchantId WHERE m.role='admin';

-- EXPECTED RESULT
-- Admin settlement rows are correctly owned by the admin account.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
