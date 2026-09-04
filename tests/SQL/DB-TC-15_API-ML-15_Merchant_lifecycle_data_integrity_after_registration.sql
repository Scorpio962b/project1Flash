-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-15
-- Priority: P0
-- Layer 2 API Test: API-ML-15
-- API Test: Merchant lifecycle data integrity after registration
-- API Focus: Verify merchant identity fields and references are complete
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Merchant identity integrity

SELECT * FROM dbo.Merchants WHERE email IS NULL OR msisdn IS NULL OR merchantName IS NULL OR role IS NULL OR status IS NULL;

-- EXPECTED RESULT
-- 0 rows.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
