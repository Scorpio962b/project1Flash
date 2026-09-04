-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-16
-- Priority: P0
-- Layer 2 API Test: API-FD-01
-- API Test: Merchant purchase
-- API Focus: Verify purchase transaction is written to WalletTransactions
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Purchase ledger record

SELECT * FROM dbo.WalletTransactions WHERE merchantId=1 ORDER BY id DESC;

-- EXPECTED RESULT
-- The API purchase has a corresponding wallet transaction.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
