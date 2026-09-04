-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-27
-- Priority: P0
-- Layer 2 API Test: API-FD-12
-- API Test: Wallet transaction history
-- API Focus: Verify API history can be reconciled with WalletTransactions
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Transaction history reconciliation

SELECT * FROM dbo.WalletTransactions WHERE merchantId=2 ORDER BY id;

-- EXPECTED RESULT
-- Database rows reconcile with the API transaction-history response.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
