-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-06
-- Priority: P0
-- Layer 2 API Test: API-ML-06
-- API Test: Invalid login credentials
-- API Focus: Verify no financial/merchant record is created or changed by failed login
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Failed login must not create a merchant

SELECT email, COUNT(*) AS rowCount FROM dbo.Merchants GROUP BY email HAVING COUNT(*) > 1;

-- EXPECTED RESULT
-- 0 duplicate identity rows.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
