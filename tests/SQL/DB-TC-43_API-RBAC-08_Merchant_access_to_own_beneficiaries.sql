-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-43
-- Priority: P1
-- Layer 2 API Test: API-RBAC-08
-- API Test: Merchant access to own beneficiaries
-- API Focus: Verify beneficiaries are isolated by merchantId
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Merchant beneficiary isolation

SELECT b.merchantId,COUNT(*) beneficiaryCount FROM dbo.Beneficiaries b GROUP BY b.merchantId ORDER BY b.merchantId;

-- EXPECTED RESULT
-- Beneficiaries remain separated by merchantId.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
