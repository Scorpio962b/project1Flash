-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-38
-- Priority: P1
-- Layer 2 API Test: API-RBAC-03
-- API Test: Admin-only merchant metrics endpoint
-- API Focus: Verify admin metrics are based on merchant records
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Admin metrics merchant count

SELECT COUNT(*) AS merchantCount FROM dbo.Merchants WHERE role='merchant';

-- EXPECTED RESULT
-- The count matches the API metrics expectation.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
