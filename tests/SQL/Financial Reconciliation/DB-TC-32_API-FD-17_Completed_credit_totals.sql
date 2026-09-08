-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-32
-- Priority: P0
-- Layer 2 API Test: API-FD-17
-- API Test: Completed credit totals
-- API Focus: Verify completed credit ledger totals
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Completed credits

SELECT merchantId,ROUND(SUM(amount),2) totalCredits FROM dbo.WalletTransactions WHERE status='completed' AND transactionType='credit' GROUP BY merchantId ORDER BY merchantId;

-- EXPECTED RESULT
-- Credit totals match the expected ledger.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
