-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-21
-- Priority: P0
-- Layer 2 API Test: API-FD-06
-- API Test: Data purchase
-- API Focus: Verify data/service purchase is recorded correctly
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Data transaction

SELECT * FROM dbo.WalletTransactions WHERE merchantId=1 AND serviceType='data' ORDER BY id DESC;

-- EXPECTED RESULT
-- The expected data transaction exists and is correctly classified.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
