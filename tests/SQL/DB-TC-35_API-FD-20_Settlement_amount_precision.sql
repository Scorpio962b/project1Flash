-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-35
-- Priority: P0
-- Layer 2 API Test: API-FD-20
-- API Test: Settlement amount precision
-- API Focus: Verify settlement amounts use valid monetary precision
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Settlement precision

SELECT * FROM dbo.Settlements WHERE amount*100 <> ROUND(amount*100,0);

-- EXPECTED RESULT
-- 0 rows.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
