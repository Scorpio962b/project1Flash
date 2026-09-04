-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-42
-- Priority: P1
-- Layer 2 API Test: API-RBAC-07
-- API Test: Merchant access to own payment methods
-- API Focus: Verify payment methods are isolated by merchantId
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Merchant payment-method isolation

SELECT pm.merchantId,COUNT(*) methodCount FROM dbo.PaymentMethods pm GROUP BY pm.merchantId ORDER BY pm.merchantId;

-- EXPECTED RESULT
-- Payment methods remain separated by merchantId.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
