-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-02
-- Priority: P0
-- Layer 2 API Test: API-ML-02
-- API Test: Register merchant with duplicate email
-- API Focus: Verify duplicate merchant email is not created
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Duplicate merchant emails

SELECT email, COUNT(*) AS duplicateCount FROM dbo.Merchants GROUP BY email HAVING COUNT(*) > 1;

-- EXPECTED RESULT
-- 0 rows.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
