-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-033
-- Test Group: Data Hygiene & Constraints
-- Priority: P1
-- Scenario: Check duplicate merchant MSISDNs

-- PURPOSE
-- Detect duplicate merchant contact identifiers.

-- SQL
SELECT msisdn, COUNT(*) AS duplicateCount
FROM dbo.Merchants
GROUP BY msisdn
HAVING COUNT(*) > 1;

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
