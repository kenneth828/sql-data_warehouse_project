/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following action:
    - Truncates the bronze tables before loading data.
===============================================================================
*/


USE DataWarehouse;

SELECT 'Loading Bronze Layer' AS msg;

-- CRM CUSTOMER INFO
SELECT 'Truncating bronze.crm_cust_info' AS msg;
TRUNCATE TABLE bronze.crm_cust_info;

LOAD DATA LOCAL INFILE '/Users/kenneth/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
INTO TABLE bronze.crm_cust_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- CRM PRODUCT INFO
SELECT 'Truncating bronze.crm_prd_info' AS msg;
TRUNCATE TABLE bronze.crm_prd_info;

LOAD DATA LOCAL INFILE '/Users/kenneth/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
INTO TABLE bronze.crm_prd_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- CRM SALES DETAILS
SELECT 'Truncating bronze.crm_sales_details' AS msg;
TRUNCATE TABLE bronze.crm_sales_details;

LOAD DATA LOCAL INFILE '/Users/kenneth/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
INTO TABLE bronze.crm_sales_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- ERP LOCATION
SELECT 'Truncating bronze.erp_loc_a101' AS msg;
TRUNCATE TABLE bronze.erp_loc_a101;

LOAD DATA LOCAL INFILE '/Users/kenneth/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
INTO TABLE bronze.erp_loc_a101
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- ERP CUSTOMER
SELECT 'Truncating bronze.erp_cust_az12' AS msg;
TRUNCATE TABLE bronze.erp_cust_az12;

LOAD DATA LOCAL INFILE '/Users/kenneth/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
INTO TABLE bronze.erp_cust_az12
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- ERP PRICE CATEGORY
SELECT 'Truncating bronze.erp_px_cat_g1v2' AS msg;
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

LOAD DATA LOCAL INFILE '/Users/kenneth/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
INTO TABLE bronze.erp_px_cat_g1v2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT 'Bronze Layer Load Completed' AS msg;
