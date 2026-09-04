-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-48
-- Priority: P1
-- Layer 2 API Test: API-RBAC-13
-- API Test: Role value integrity
-- API Focus: Verify roles contain only the supported admin/merchant values
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Allowed roles

SELECT DISTINCT role FROM dbo.Merchants WHERE LOWER(role) NOT IN ('merchant','admin') OR role IS NULL;

-- EXPECTED RESULT
-- 0 rows.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
