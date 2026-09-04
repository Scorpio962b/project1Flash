-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-50
-- Priority: P1
-- Layer 2 API Test: API-RBAC-15
-- API Test: Identity/reference integrity across related tables
-- API Focus: Verify payment methods, beneficiaries, settlements and transactions reference valid merchants
-- Layer 2 Group: Identity & RBAC
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Full identity reference integrity

SELECT 'PaymentMethod' sourceTable,pm.merchantId FROM dbo.PaymentMethods pm LEFT JOIN dbo.Merchants m ON m.id=pm.merchantId WHERE m.id IS NULL UNION ALL SELECT 'Beneficiary',b.merchantId FROM dbo.Beneficiaries b LEFT JOIN dbo.Merchants m ON m.id=b.merchantId WHERE m.id IS NULL UNION ALL SELECT 'Settlement',s.merchantId FROM dbo.Settlements s LEFT JOIN dbo.Merchants m ON m.id=s.merchantId WHERE m.id IS NULL UNION ALL SELECT 'WalletTransaction',wt.merchantId FROM dbo.WalletTransactions wt LEFT JOIN dbo.Merchants m ON m.id=wt.merchantId WHERE m.id IS NULL;

-- EXPECTED RESULT
-- 0 rows.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
