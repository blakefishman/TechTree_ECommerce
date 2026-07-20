-- Examining dataset in Google BigQuery for the first time and performing various checks for duplicates, errors, inconsistencies, ranges, etc.


-- 1) Duplicate orders check (performed for all tables separately)

SELECT
    id,
    COUNT(*) AS duplicate_id_count
FROM core.orders
GROUP BY 1
HAVING duplicate_id_count > 1
;


-- 2) Null check (performed for all tables separately)

SELECT
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_count_customer_id,
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS null_count_id,
    SUM(CASE WHEN purchase_ts IS NULL THEN 1 ELSE 0 END) AS null_count_purchase_ts,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_count_product_id,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS null_count_product_name,
    SUM(CASE WHEN usd_price IS NULL THEN 1 ELSE 0 END) AS null_count_usd_price,
    SUM(CASE WHEN local_price IS NULL THEN 1 ELSE 0 END) AS null_count_local_price,
    SUM(CASE WHEN currency IS NULL THEN 1 ELSE 0 END) AS null_count_currency,
    SUM(CASE WHEN purchase_platform IS NULL THEN 1 ELSE 0 END) AS null_count_purchase_platform
FROM core.orders
;


-- 3) Empty check for strings (performed for all tables separately)

SELECT
    SUM(CASE WHEN TRIM(customer_id) = '' THEN 1 ELSE 0 END) AS empty_count_customer_id,
    SUM(CASE WHEN TRIM(id) = '' THEN 1 ELSE 0 END) AS empty_count_id,
    SUM(CASE WHEN TRIM(purchase_ts) = '' THEN 1 ELSE 0 END) AS empty_count_purchase_ts,
    SUM(CASE WHEN TRIM(product_id) = '' THEN 1 ELSE 0 END) AS empty_count_product_id,
    SUM(CASE WHEN TRIM(product_name) = '' THEN 1 ELSE 0 END) AS empty_count_product_name,
    SUM(CASE WHEN TRIM(currency) = '' THEN 1 ELSE 0 END) AS empty_count_currency,
    SUM(CASE WHEN TRIM(purchase_platform) = '' THEN 1 ELSE 0 END) AS empty_count_purchase_platform,
FROM core.orders
;


-- 4) Check distinct product names, purchase platforms, marketing channels, account creation methods, and loyalty categories for inconsistencies and typos

SELECT
    DISTINCT product_name
FROM core.orders
ORDER BY 1
;

SELECT
    DISTINCT purchase_platform
FROM core.orders
ORDER BY 1
;

SELECT
    DISTINCT marketing_channel,
    COUNT(marketing_channel) AS marketing_channel_count
FROM core.customers
GROUP BY 1
ORDER BY 1
;

SELECT
    DISTINCT account_creation_method,
    COUNT(account_creation_method) AS account_creation_method_count
FROM core.customers
GROUP BY 1
ORDER BY 1
;

SELECT
    DISTINCT loyalty_program
FROM core.customers
ORDER BY 1
;


-- 5) Check countries and regions for inconsistencies and typos

SELECT
    DISTINCT c.country_code,
    r.region
FROM core.customers AS c
LEFT JOIN core.region_lookup AS r
ON c.country_code = r.country_code
ORDER BY 1
;

SELECT
    DISTINCT c.country_code,
    COUNT(c.country_code) AS count_null
FROM core.customers AS c
LEFT JOIN core.region_lookup AS r
ON c.country_code = r.country_code 
WHERE r.region IS NULL
GROUP BY 1
;


---- 6) Exploration of invalid date formatting for purchase_ts

-- Count string records that would fail CAST conversion to date due to invalid format
SELECT
    COUNT(*) AS invalid_count
FROM core.orders
WHERE SAFE_CAST(purchase_ts AS DATE) IS NULL -- only return rows that fail to convert
    AND purchase_ts IS NOT NULL -- only return rows where there is actually data present
;

-- Identify specific formats from date string
SELECT
    CASE
        WHEN SAFE.PARSE_DATE('%Y-%m-%d', purchase_ts) IS NOT NULL THEN 'YYYY-MM-DD'
        WHEN SAFE.PARSE_DATE('%m/%d/%Y', purchase_ts) IS NOT NULL THEN 'YYYY/MM/DD'
        WHEN purchase_ts LIKE '%' THEN 'Timestamp'
        WHEN purchase_ts IS NULL THEN 'Null'
        WHEN purchase_ts = '' THEN 'Empty'
        ELSE 'Other/Invalid'
    END AS date_format_type,
    COUNT(*) AS count -- verify total result count is equal to total records
FROM core.orders
GROUP BY date_format_type
;

-- View sample of failed CAST date strings
SELECT
    purchase_ts
FROM core.orders
WHERE SAFE_CAST(purchase_ts AS DATE) IS NULL
ORDER BY RAND()
LIMIT 50
;

-- View sample of failed CAST timestamp strings
SELECT
    purchase_ts
FROM core.orders
WHERE SAFE_CAST(purchase_ts AS DATE) IS NULL AND purchase_ts LIKE '%:%'
ORDER BY RAND()
LIMIT 50
;



-- 7) Examine date ranges for purchases, shipping, delivery, refunds, and accounts created on for outliers

SELECT
    MIN(purchase_ts) AS earliest_purchase_date,
    MAX(purchase_ts) AS latest_purchase_date,
    MIN(ship_ts) AS earliest_ship_date,
    MAX(ship_ts) AS latest_ship_date,
    MIN(delivery_ts) AS earliest_delivery_date,
    MAX(delivery_ts) AS latest_delivery_date,
    MIN(refund_ts) AS earliest_refund_date,
    MAX(refund_ts) AS latest_refund_date
FROM core.order_status
;

SELECT
    MIN(account_created_on) AS earliest_acc_created_on,
    MAX(account_created_on) AS latest_acc_created_on
FROM core.customers
;


-- 8) Examine price ranges for outliers (also performed for local_price)

SELECT
    AVG(usd_price) AS avg_price,
    MAX(usd_price) AS max_price,
    MIN(usd_price) AS min_price,
    STDDEV(usd_price) AS stddev_price,
    VARIANCE(usd_price) AS variance_price
FROM core.orders
;

WITH price_validation AS (
SELECT 
    CASE 
        WHEN usd_price IS NULL THEN 'missing_value'
        WHEN usd_price < 0 THEN 'negative_value'
        WHEN usd_price = 0 THEN 'zero_value'
        WHEN usd_price > 10000 THEN 'suspiciously_high'
        ELSE 'valid'
    END AS validation_flag
FROM core.orders
)

SELECT
    validation_flag,
    COUNT(validation_flag) AS validation_flag_count
FROM price_validation
GROUP BY 1
ORDER BY 2 DESC
;


-- 9) Investigate $0 and null transactions further

SELECT
    id,
    usd_price,
    local_price,
    currency
FROM core.orders
WHERE usd_price = 0
    OR local_price = 0
;

SELECT
    id,
    usd_price,
    local_price,
    currency
FROM core.orders
WHERE usd_price IS NULL
    OR local_price IS NULL
;


-- 10) Check for length issues in currency

SELECT currency,
  LENGTH(currency) AS length
FROM core.orders
WHERE LENGTH(currency) != 3
;


-- 11) Check for any orders with invalid customer IDs

SELECT *
FROM core.orders
WHERE customer_id NOT IN (SELECT id FROM core.customers)
;
