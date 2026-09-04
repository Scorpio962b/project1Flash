-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-024
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Verify settlement total does not exceed available completed credits

-- PURPOSE
-- Detect settlements that exceed recorded funding.

-- SQL
SELECT
    s.merchantId,
    ROUND(SUM(s.amount),2) AS settlementTotal,
    ROUND(COALESCE(SUM(CASE WHEN wt.status='completed' AND wt.transactionType='credit' THEN wt.amount ELSE 0 END),0),2) AS completedCredits
FROM dbo.Settlements s
LEFT JOIN dbo.WalletTransactions wt ON wt.merchantId = s.merchantId
GROUP BY s.merchantId
HAVING SUM(s.amount) >
       COALESCE(SUM(CASE WHEN wt.status='completed' AND wt.transactionType='credit' THEN wt.amount ELSE 0 END),0);

-- EXPECTED RESULT
-- 0 rows are returned if settlements must be funded from recorded completed credits.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
