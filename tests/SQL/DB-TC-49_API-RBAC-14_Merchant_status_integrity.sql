-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-49
-- Priority: P1
-- Layer 2 API Test: API-RBAC-14
-- API Test: Merchant status integrity
-- API Focus: Verify inactive merchants are not treated as active financial participants
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Inactive financial participants

SELECT m.id,m.merchantName,m.status,COUNT(wt.id) transactionCount FROM dbo.Merchants m LEFT JOIN dbo.WalletTransactions wt ON wt.merchantId=m.id WHERE m.status<>'active' GROUP BY m.id,m.merchantName,m.status;

-- EXPECTED RESULT
-- No completed financial activity exists for inactive merchants where the API/business rule forbids it.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
