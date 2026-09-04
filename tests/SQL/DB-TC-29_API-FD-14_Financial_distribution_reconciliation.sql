-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-29
-- Priority: P0
-- Layer 2 API Test: API-FD-14
-- API Test: Financial distribution reconciliation
-- API Focus: Verify settlements and wallet transactions have valid merchant links
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Orphan financial records

SELECT 'Settlement' sourceTable, s.merchantId FROM dbo.Settlements s LEFT JOIN dbo.Merchants m ON m.id=s.merchantId WHERE m.id IS NULL UNION ALL SELECT 'WalletTransaction',wt.merchantId FROM dbo.WalletTransactions wt LEFT JOIN dbo.Merchants m ON m.id=wt.merchantId WHERE m.id IS NULL;

-- EXPECTED RESULT
-- 0 rows.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
