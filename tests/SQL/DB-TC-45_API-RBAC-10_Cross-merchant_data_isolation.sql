-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-45
-- Priority: P1
-- Layer 2 API Test: API-RBAC-10
-- API Test: Cross-merchant data isolation
-- API Focus: Verify supporting records cannot be linked to the wrong merchant
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Cross-merchant reference integrity

SELECT pm.merchantId FROM dbo.PaymentMethods pm LEFT JOIN dbo.Merchants m ON m.id=pm.merchantId WHERE m.id IS NULL UNION ALL SELECT b.merchantId FROM dbo.Beneficiaries b LEFT JOIN dbo.Merchants m ON m.id=b.merchantId WHERE m.id IS NULL;

-- EXPECTED RESULT
-- 0 rows.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
