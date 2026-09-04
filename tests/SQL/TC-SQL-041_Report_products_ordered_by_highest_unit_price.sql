-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-041
-- Test Group: Business Intelligence Reports
-- Priority: P2
-- Scenario: Report products ordered by highest unit price

-- PURPOSE
-- Support product pricing analysis.

-- SQL
SELECT id, name, productType, brand, unitPrice
FROM dbo.Products
ORDER BY unitPrice DESC;

-- EXPECTED RESULT
-- Products are returned from highest to lowest unit price.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
