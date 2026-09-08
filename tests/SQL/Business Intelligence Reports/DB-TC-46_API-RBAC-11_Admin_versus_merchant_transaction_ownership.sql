-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-46
-- Priority: P1
-- Layer 2 API Test: API-RBAC-11
-- API Test: Admin versus merchant transaction ownership
-- API Focus: Verify transaction ownership uses the correct merchantId
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Transaction ownership

SELECT wt.id,wt.merchantId,m.email,m.role FROM dbo.WalletTransactions wt JOIN dbo.Merchants m ON m.id=wt.merchantId ORDER BY wt.id;

-- EXPECTED RESULT
-- Each transaction belongs to the correct account.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
