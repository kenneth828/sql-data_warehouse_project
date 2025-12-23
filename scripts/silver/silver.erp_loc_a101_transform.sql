INSERT INTO silver.erp_loc_a101(cid, cntry)
SELECT 
REPLACE(cid,'-','') AS cid,
CASE WHEN  TRIM(cntry) IN ('USA','US','United States') THEN ('United States')
	WHEN TRIM(cntry) IN ('DE','Germany') THEN ('Germany')
    WHEN TRIM(cntry) = '' OR TRIM(cntry) IS NULL THEN 'n/a'
    ELSE TRIM(cntry)
END AS cntry
FROM bronze.erp_loc_a101
