-- Layer 3 — Database Integrity & Financial Audit
-- Database Test Case: DB-TC-28
-- Priority: P0
-- Layer 2 API Test: API-FD-13
-- API Test: List settlements
-- API Focus: Verify API settlement data matches dbo.Settlements
-- Layer 2 Group: Financial & Distribution Logic
--
-- TRACEABILITY
-- Layer 2 API request -> Database state -> SQL validation -> Expected result
--
-- DATABASE TEST: Settlement reconciliation

SELECT s.*,m.merchantName FROM dbo.Settlements s JOIN dbo.Merchants m ON m.id=s.merchantId ORDER BY s.id;

-- EXPECTED RESULT
-- API settlement records match the database records.

-- PASS / FAIL
-- PASS = Database result agrees with the API expected result/business rule.
-- FAIL = Unexpected rows/values are returned or the database state does not support
--        the API result.
