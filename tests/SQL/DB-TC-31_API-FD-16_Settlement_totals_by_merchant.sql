-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-31
-- Priority: P0
-- Layer 2 API Test: API-FD-16
-- API Test: Settlement totals by merchant
-- API Focus: Verify settlement totals are mathematically correct
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Settlement totals

SELECT merchantId,ROUND(SUM(amount),2) settlementTotal FROM dbo.Settlements GROUP BY merchantId ORDER BY merchantId;

-- EXPECTED RESULT
-- Totals match expected API settlement values.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
