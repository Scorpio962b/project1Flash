-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-23
-- Priority: P0
-- Layer 2 API Test: API-FD-08
-- API Test: Invalid transfer amount = 0
-- API Focus: Verify invalid transfer does not create a completed ledger transaction
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Zero transfer must not complete

SELECT * FROM dbo.WalletTransactions WHERE amount=0 AND status='completed';

-- EXPECTED RESULT
-- 0 rows.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
