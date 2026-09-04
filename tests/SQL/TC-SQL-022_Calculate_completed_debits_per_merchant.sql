-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-022
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Calculate completed debits per merchant

-- PURPOSE
-- Validate debit-side financial arithmetic.

-- SQL
SELECT merchantId, ROUND(SUM(amount),2) AS totalDebits
FROM dbo.WalletTransactions
WHERE status = 'completed'
  AND transactionType = 'debit'
GROUP BY merchantId
ORDER BY merchantId;

-- EXPECTED RESULT
-- Totals match the expected debit ledger for each merchant. If no debits exist in the current dataset, the query should return no rows.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
