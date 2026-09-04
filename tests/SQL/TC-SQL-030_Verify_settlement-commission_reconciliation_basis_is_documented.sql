-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-030
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Verify settlement/commission reconciliation basis is documented

-- PURPOSE
-- Provides the baseline figures needed for multi-table settlement reconciliation.

-- SQL
SELECT
    'Settlements' AS tableName,
    COUNT(*) AS rowCount,
    ROUND(COALESCE(SUM(amount),0),2) AS amountTotal
FROM dbo.Settlements
UNION ALL
SELECT
    'WalletTransactions',
    COUNT(*),
    ROUND(COALESCE(SUM(amount),0),2)
FROM dbo.WalletTransactions
WHERE status = 'completed';

-- EXPECTED RESULT
-- The totals are captured and compared against the approved settlement formula. Any commission component must come from an actual database column/table and not be assumed.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
