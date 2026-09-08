-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-008
-- Test Group: Financial Reconciliation
-- Priority: P0
-- Scenario: Compare merchant wallet balance with completed wallet credits/debits

-- PURPOSE
-- Reconcile merchant wallet balances against the transaction ledger. If the application stores an opening balance separately, document that opening balance before using this as a strict equality test.

-- SQL
SELECT
    m.id,
    m.merchantName,
    m.walletBalance,
    SUM(CASE WHEN wt.status = 'completed' AND wt.transactionType = 'credit' THEN wt.amount ELSE 0 END) AS credits,
    SUM(CASE WHEN wt.status = 'completed' AND wt.transactionType = 'debit' THEN wt.amount ELSE 0 END) AS debits,
    SUM(CASE WHEN wt.status = 'completed' AND wt.transactionType = 'credit' THEN wt.amount ELSE 0 END)
      - SUM(CASE WHEN wt.status = 'completed' AND wt.transactionType = 'debit' THEN wt.amount ELSE 0 END) AS calculatedBalance
FROM dbo.Merchants m
LEFT JOIN dbo.WalletTransactions wt ON wt.merchantId = m.id
GROUP BY m.id, m.merchantName, m.walletBalance
HAVING ABS(
    m.walletBalance -
    (
      SUM(CASE WHEN wt.status = 'completed' AND wt.transactionType = 'credit' THEN wt.amount ELSE 0 END)
      - SUM(CASE WHEN wt.status = 'completed' AND wt.transactionType = 'debit' THEN wt.amount ELSE 0 END)
    )
) > 0.01;

-- EXPECTED RESULT
-- 0 rows are returned where the walletBalance is intended to equal the completed credit/debit ledger.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
