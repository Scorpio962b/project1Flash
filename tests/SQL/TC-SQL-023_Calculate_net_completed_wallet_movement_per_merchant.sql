-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-023
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Calculate net completed wallet movement per merchant

-- PURPOSE
-- Validate core ledger arithmetic.

-- SQL
SELECT
    merchantId,
    ROUND(
      SUM(CASE WHEN transactionType='credit' THEN amount ELSE 0 END)
      - SUM(CASE WHEN transactionType='debit' THEN amount ELSE 0 END),
      2
    ) AS netMovement
FROM dbo.WalletTransactions
WHERE status = 'completed'
GROUP BY merchantId
ORDER BY merchantId;

-- EXPECTED RESULT
-- Net movement equals credits minus debits for every merchant.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
