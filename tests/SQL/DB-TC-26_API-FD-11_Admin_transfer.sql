-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-26
-- Priority: P0
-- Layer 2 API Test: API-FD-11
-- API Test: Admin transfer
-- API Focus: Verify admin transfer is recorded against the admin account
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Admin transfer record

SELECT * FROM dbo.WalletTransactions WHERE merchantId=2 AND transactionType='transfer' ORDER BY id DESC;

-- EXPECTED RESULT
-- The transfer exists against the admin account.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
