-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-037
-- Test Group: Data Hygiene & Constraints
-- Priority: P1
-- Scenario: Check product prices for invalid numeric values

-- PURPOSE
-- Validate product monetary values.

-- SQL
SELECT *
FROM dbo.Products
WHERE unitPrice IS NULL OR unitPrice <= 0
   OR unitPrice * 100 <> ROUND(unitPrice * 100,0);

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
