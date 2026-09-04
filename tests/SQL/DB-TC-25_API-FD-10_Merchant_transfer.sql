-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-25
-- Priority: P0
-- Layer 2 API Test: API-FD-10
-- API Test: Merchant transfer
-- API Focus: Verify transfer is recorded against the correct merchant
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Merchant transfer record

SELECT * FROM dbo.WalletTransactions WHERE merchantId=1 AND transactionType='transfer' ORDER BY id DESC;

-- EXPECTED RESULT
-- The transfer exists against the correct merchant.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
