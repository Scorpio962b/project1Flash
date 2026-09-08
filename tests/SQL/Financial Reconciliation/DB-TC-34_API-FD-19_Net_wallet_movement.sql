-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-34
-- Priority: P0
-- Layer 2 API Test: API-FD-19
-- API Test: Net wallet movement
-- API Focus: Verify credits minus debits reconcile
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Net wallet movement

SELECT merchantId,ROUND(SUM(CASE WHEN transactionType='credit' THEN amount ELSE 0 END)-SUM(CASE WHEN transactionType='debit' THEN amount ELSE 0 END),2) netMovement FROM dbo.WalletTransactions WHERE status='completed' GROUP BY merchantId;

-- EXPECTED RESULT
-- Net movement equals credits minus debits.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
