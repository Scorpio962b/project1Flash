-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-039
-- Test Group: Data Hygiene & Constraints
-- Priority: P1
-- Scenario: Check payment methods for missing masked card details

-- PURPOSE
-- Verify payment method records are complete enough for audit.

-- SQL
SELECT *
FROM dbo.PaymentMethods
WHERE nickname IS NULL OR LTRIM(RTRIM(nickname)) = ''
   OR cardNumber IS NULL OR LTRIM(RTRIM(cardNumber)) = ''
   OR expiryDate IS NULL OR LTRIM(RTRIM(expiryDate)) = '';

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
