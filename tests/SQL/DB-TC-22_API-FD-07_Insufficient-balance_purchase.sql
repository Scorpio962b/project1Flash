-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-22
-- Priority: P0
-- Layer 2 API Test: API-FD-07
-- API Test: Insufficient-balance purchase
-- API Focus: Verify rejected purchase does not create a completed debit
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Insufficient balance must not complete

SELECT * FROM dbo.WalletTransactions WHERE merchantId=1 AND amount=60000 AND status='completed';

-- EXPECTED RESULT
-- 0 rows.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
