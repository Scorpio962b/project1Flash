-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-44
-- Priority: P1
-- Layer 2 API Test: API-RBAC-09
-- API Test: Merchant access to own wallet
-- API Focus: Verify wallet data is isolated by merchantId
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Merchant wallet isolation

SELECT id,merchantName,walletBalance FROM dbo.Merchants WHERE role='merchant' ORDER BY id;

-- EXPECTED RESULT
-- Merchant wallet values are tied to the correct merchant IDs.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
