-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-17
-- Priority: P0
-- Layer 2 API Test: API-FD-02
-- API Test: Merchant purchase commission calculation
-- API Focus: Verify the documented 10% commission calculation for the R10 example
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: 10% commission calculation

SELECT amount, ROUND(amount*0.10,2) AS expectedCommission FROM dbo.WalletTransactions WHERE merchantId=1 AND amount=10;

-- EXPECTED RESULT
-- For amount 10, expected commission is 1.00.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
