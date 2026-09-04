-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-010
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Verify duplicate settlement descriptions are not used for the same merchant

-- PURPOSE
-- Detect possible duplicate settlement/ghost actions.

-- SQL
SELECT merchantId, description, COUNT(*) AS duplicateCount
FROM dbo.Settlements
GROUP BY merchantId, description
HAVING COUNT(*) > 1;

-- EXPECTED RESULT
-- 0 rows are returned.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
