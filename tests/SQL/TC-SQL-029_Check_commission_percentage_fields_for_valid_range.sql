-- Layer 3 — Database Integrity & Financial Audit
-- Test Case: TC-SQL-029
-- Test Group: Settlement Math Verification
-- Priority: P0
-- Scenario: Check commission percentage fields for valid range

-- PURPOSE
-- Check that commission percentages are between 0% and 100% where such fields exist.

-- SQL
DECLARE @sql nvarchar(max) = N'';

SELECT @sql = STRING_AGG(
    N'SELECT ''' + TABLE_SCHEMA + N'.' + TABLE_NAME + N'.' + COLUMN_NAME + N''' AS fieldName, '
    + N'CAST(' + QUOTENAME(COLUMN_NAME) + N' AS decimal(18,4)) AS commissionValue '
    + N'FROM ' + QUOTENAME(TABLE_SCHEMA) + N'.' + QUOTENAME(TABLE_NAME)
    + N' WHERE TRY_CONVERT(decimal(18,4),' + QUOTENAME(COLUMN_NAME) + N') IS NOT NULL '
    + N' AND (TRY_CONVERT(decimal(18,4),' + QUOTENAME(COLUMN_NAME) + N') < 0 '
    + N' OR TRY_CONVERT(decimal(18,4),' + QUOTENAME(COLUMN_NAME) + N') > 100)',
    N' UNION ALL '
)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE LOWER(COLUMN_NAME) LIKE '%commission%'
  AND DATA_TYPE IN ('decimal','numeric','float','real','money','smallmoney','int','bigint');

IF @sql <> N''
    EXEC sp_executesql @sql;
ELSE
    SELECT 'NO COMMISSION COLUMN FOUND' AS result;

-- EXPECTED RESULT
-- 0 invalid commission values are returned. If 'NO COMMISSION COLUMN FOUND' appears, commission validation cannot be performed from the supplied schema.

-- PASS / FAIL
-- PASS = Query returns the expected result above.
-- FAIL = Query returns unexpected rows/values or the expected business rule is not met.
