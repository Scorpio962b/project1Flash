-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-12
-- Priority: P0
-- Layer 2 API Test: API-ML-12
-- API Test: Create beneficiary
-- API Focus: Verify the beneficiary is inserted for the correct merchant
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Created beneficiary ownership

SELECT * FROM dbo.Beneficiaries WHERE beneficiaryName='Amukelani Dlamini';

-- EXPECTED RESULT
-- The beneficiary exists for the correct merchant.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
