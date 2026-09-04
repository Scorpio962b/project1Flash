-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-11
-- Priority: P0
-- Layer 2 API Test: API-ML-11
-- API Test: List beneficiaries
-- API Focus: Verify API beneficiaries belong to the requested merchant
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Beneficiaries for merchant

SELECT b.* FROM dbo.Beneficiaries b JOIN dbo.Merchants m ON m.id=b.merchantId WHERE m.email='merchant@flashgateway.local';

-- EXPECTED RESULT
-- Only that merchant's beneficiaries are returned.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
