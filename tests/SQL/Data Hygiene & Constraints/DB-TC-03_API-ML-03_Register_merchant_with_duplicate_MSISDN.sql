-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-03
-- Priority: P0
-- Layer 2 API Test: API-ML-03
-- API Test: Register merchant with duplicate MSISDN
-- API Focus: Verify duplicate merchant MSISDN is not created
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Duplicate merchant MSISDNs

SELECT msisdn, COUNT(*) AS duplicateCount FROM dbo.Merchants GROUP BY msisdn HAVING COUNT(*) > 1;

-- EXPECTED RESULT
-- 0 rows.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
