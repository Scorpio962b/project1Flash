-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-044
-- Test Group: Business Intelligence Reports
-- Priority: P2
-- Scenario: Report product count by brand

-- PURPOSE
-- Identify brands with the largest product catalogue.

-- SQL
SELECT brand, COUNT(*) AS productCount
FROM dbo.Products
GROUP BY brand
ORDER BY productCount DESC;

-- EXPECTED RESULT
-- Counts accurately represent products by brand.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
