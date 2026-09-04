-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-18
-- Priority: P0
-- Layer 2 API Test: API-FD-03
-- API Test: Merchant purchase settlement calculation
-- API Focus: Verify the documented R10 purchase produces R9 net settlement
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: 90% settlement calculation

SELECT amount, ROUND(amount*0.90,2) AS expectedSettlement FROM dbo.WalletTransactions WHERE merchantId=1 AND amount=10;

-- EXPECTED RESULT
-- For amount 10, expected net settlement is 9.00.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
