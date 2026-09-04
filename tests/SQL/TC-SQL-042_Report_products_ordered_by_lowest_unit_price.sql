-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-042
-- Test Group: Business Intelligence Reports
-- Priority: P2
-- Scenario: Report products ordered by lowest unit price

-- PURPOSE
-- Identify low-priced products.

-- SQL
SELECT id, name, productType, brand, unitPrice
FROM dbo.Products
ORDER BY unitPrice ASC;

-- EXPECTED RESULT
-- Products are returned from lowest to highest unit price.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
