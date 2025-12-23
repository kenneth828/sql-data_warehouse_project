INSERT INTO silver.erp_cust_az12(
cid,
bdate,
gen
)
SELECT 
SUBSTRING(cid,4) AS cid,
CASE WHEN bdate > CURDATE() THEN NULL
	ELSE bdate
END AS bdate,
CASE WHEN UPPER(TRIM(gen)) IN ('F','FEMALE') THEN ('Female')
	WHEN UPPER(TRIM(gen)) IN ('M','MALE') THEN ('Male')
	ELSE 'n/a'
END AS gen
FROM bronze.erp_cust_az12
