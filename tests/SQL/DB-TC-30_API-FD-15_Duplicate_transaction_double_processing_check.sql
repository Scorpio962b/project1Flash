-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-30
-- Priority: P0
-- Layer 2 API Test: API-FD-15
-- API Test: Duplicate transaction / double processing check
-- API Focus: Verify duplicate wallet transaction signatures are absent
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Duplicate wallet transaction signatures

SELECT merchantId,amount,transactionType,serviceType,status,reference,COUNT(*) duplicateCount FROM dbo.WalletTransactions GROUP BY merchantId,amount,transactionType,serviceType,status,reference HAVING COUNT(*)>1;

-- EXPECTED RESULT
-- 0 rows unless duplicates are explicitly allowed.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
