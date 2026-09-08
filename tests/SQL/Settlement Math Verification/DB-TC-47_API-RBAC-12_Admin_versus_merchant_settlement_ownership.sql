-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-47
-- Priority: P1
-- Layer 2 API Test: API-RBAC-12
-- API Test: Admin versus merchant settlement ownership
-- API Focus: Verify settlement ownership uses the correct merchantId
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Settlement ownership

SELECT s.id,s.merchantId,m.email,m.role FROM dbo.Settlements s JOIN dbo.Merchants m ON m.id=s.merchantId ORDER BY s.id;

-- EXPECTED RESULT
-- Each settlement belongs to the correct account.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
