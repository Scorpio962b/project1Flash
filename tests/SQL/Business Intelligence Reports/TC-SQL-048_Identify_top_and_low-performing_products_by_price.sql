-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-048
-- Test Group: Business Intelligence Reports
-- Priority: P2
-- Scenario: Identify top and low-performing products by price

-- PURPOSE
-- Provides the requested top/low product view using a field that exists in the supplied schema.

-- SQL
WITH RankedProducts AS (
    SELECT
        id, name, productType, brand, unitPrice,
        RANK() OVER (ORDER BY unitPrice DESC) AS highRank,
        RANK() OVER (ORDER BY unitPrice ASC) AS lowRank
    FROM dbo.Products
)
SELECT *
FROM RankedProducts
WHERE highRank <= 3 OR lowRank <= 3
ORDER BY unitPrice DESC;

-- EXPECTED RESULT
-- The report returns the highest- and lowest-priced products based on the available product data.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
