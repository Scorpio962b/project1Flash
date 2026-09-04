-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-19
-- Priority: P0
-- Layer 2 API Test: API-FD-04
-- API Test: Airtime purchase
-- API Focus: Verify airtime transaction is recorded with correct amount/type/status
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Airtime transaction

SELECT * FROM dbo.WalletTransactions WHERE merchantId=2 AND serviceType='airtime' ORDER BY id DESC;

-- EXPECTED RESULT
-- The expected airtime transaction exists with the correct amount/type/status.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
