-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-012
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Verify settlements do not reference inactive/non-existent merchants

-- PURPOSE
-- Detect financial records attached to merchants that should not be transacting.

-- SQL
SELECT s.*, m.status
FROM dbo.Settlements s
JOIN dbo.Merchants m ON m.id = s.merchantId
WHERE m.status <> 'active';

-- EXPECTED RESULT
-- 0 rows are returned for settlements that are required to belong only to active merchants.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
