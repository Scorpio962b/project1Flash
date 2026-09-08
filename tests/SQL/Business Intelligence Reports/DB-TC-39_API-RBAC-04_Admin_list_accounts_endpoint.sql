-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-39
-- Priority: P1
-- Layer 2 API Test: API-RBAC-04
-- API Test: Admin list accounts endpoint
-- API Focus: Verify returned account data matches the correct database records
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Account list reconciliation

SELECT id,email,role,walletBalance,status FROM dbo.Merchants ORDER BY id;

-- EXPECTED RESULT
-- Database account list matches the API response for the requested scope.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
