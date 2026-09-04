-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-021
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Calculate completed credits per merchant

-- PURPOSE
-- Validate credit-side financial arithmetic.

-- SQL
SELECT merchantId, ROUND(SUM(amount),2) AS totalCredits
FROM dbo.WalletTransactions
WHERE status = 'completed'
  AND transactionType = 'credit'
GROUP BY merchantId
ORDER BY merchantId;

-- EXPECTED RESULT
-- Totals match the expected credit ledger for each merchant.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
