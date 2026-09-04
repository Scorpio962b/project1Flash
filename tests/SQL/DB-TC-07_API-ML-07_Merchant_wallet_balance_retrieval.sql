-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-07
-- Priority: P0
-- Layer 2 API Test: API-ML-07
-- API Test: Merchant wallet balance retrieval
-- API Focus: Compare the API wallet balance with dbo.Merchants.walletBalance
-- Layer 2 Group: Merchant Lifecycle
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Wallet balance reconciliation

SELECT id, merchantName, walletBalance FROM dbo.Merchants ORDER BY id;

-- EXPECTED RESULT
-- Values match the API wallet balance for the same merchant.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
