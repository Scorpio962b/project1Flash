-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-33
-- Priority: P0
-- Layer 2 API Test: API-FD-18
-- API Test: Completed debit totals
-- API Focus: Verify completed debit ledger totals
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Completed debits

SELECT merchantId,ROUND(SUM(amount),2) totalDebits FROM dbo.WalletTransactions WHERE status='completed' AND transactionType='debit' GROUP BY merchantId ORDER BY merchantId;

-- EXPECTED RESULT
-- Debit totals match the expected ledger; no rows is valid if no completed debits exist.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
