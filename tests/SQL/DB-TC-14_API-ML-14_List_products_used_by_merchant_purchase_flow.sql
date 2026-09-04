-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-14
-- Priority: P0
-- Layer 2 API Test: API-ML-14
-- API Test: List products used by merchant purchase flow
-- API Focus: Verify requested product exists with correct price/type
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Products used by purchase flow

SELECT id,name,productType,brand,unitPrice FROM dbo.Products ORDER BY id;

-- EXPECTED RESULT
-- Requested product exists with the expected details.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
