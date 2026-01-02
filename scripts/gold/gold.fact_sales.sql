CREATE VIEW gold.fact_sales AS 
SELECT 
    sd.sls_ord_num AS order_number,
    pn.product_key,  
    ci.customer_key,
    sd.sls_order_dt AS order_date, 
    sd.sls_ship_dt AS shipping_date,  
    sd.sls_due_dt AS due_date,   
    sd.sls_sales AS amount,    
    sd.sls_quantity AS quantity, 
    sd.sls_price AS price    
FROM silver.crm_sales_details AS sd
LEFT JOIN gold.dim_products AS pn
ON sd.sls_prd_key = pn.product_number
LEFT JOIN gold.dim_customers AS ci
ON sd.sls_cust_id = ci.customer_id
