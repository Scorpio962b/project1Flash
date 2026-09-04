-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-24
-- Priority: P0
-- Layer 2 API Test: API-FD-09
-- API Test: Invalid transfer recipient
-- API Focus: Verify no completed transfer is created for an invalid recipient
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Invalid recipient transfer must not complete

SELECT * FROM dbo.WalletTransactions WHERE reference IS NOT NULL AND status='completed' AND merchantId NOT IN (SELECT id FROM dbo.Merchants);

-- EXPECTED RESULT
-- 0 rows.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
