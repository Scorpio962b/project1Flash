-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-043
-- Test Group: Business Intelligence Reports
-- Priority: P2
-- Scenario: Report product count by product type

-- PURPOSE
-- Provide product mix information.

-- SQL
SELECT productType, COUNT(*) AS productCount
FROM dbo.Products
GROUP BY productType
ORDER BY productCount DESC;

-- EXPECTED RESULT
-- Counts accurately represent products in each productType.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
