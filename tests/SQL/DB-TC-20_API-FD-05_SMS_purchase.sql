-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-20
-- Priority: P0
-- Layer 2 API Test: API-FD-05
-- API Test: SMS purchase
-- API Focus: Verify service purchase is recorded and classified correctly
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: SMS transaction

SELECT * FROM dbo.WalletTransactions WHERE merchantId=1 AND serviceType='sms' ORDER BY id DESC;

-- EXPECTED RESULT
-- The expected SMS/service transaction exists and is correctly classified.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
