-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-028
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Check whether a commission field exists before commission reconciliation

-- PURPOSE
-- Explicitly validates whether the database supports the requested commission-percentage audit.

-- SQL
SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE LOWER(COLUMN_NAME) LIKE '%commission%'
ORDER BY TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME;

-- EXPECTED RESULT
-- At least one commission-related column is returned if commission percentage is a database requirement. If no rows are returned, record this as a schema/data-gap rather than inventing a commission calculation.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
