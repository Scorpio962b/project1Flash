-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-40
-- Priority: P1
-- Layer 2 API Test: API-RBAC-05
-- API Test: Merchant cannot access admin-only endpoint
-- API Focus: Verify no unauthorized database mutation occurs
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Unauthorized action database safety

SELECT * FROM dbo.WalletTransactions WHERE merchantId IS NULL;

-- EXPECTED RESULT
-- 0 rows; failed/unauthorized API actions must not create ownerless transactions.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
