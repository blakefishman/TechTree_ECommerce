-- Cleaning and organzing data in Google BigQuery for analysis in Excel and PowerBI, using the Google BigQuery connector.
    -- One query for each table individually, in order to maintain the original data structure and simplify any future data refreshes.


-- 1) Clean orders table

WITH cleaned_orders_table AS (
  SELECT
    customer_id,
    `id`,

    -- Reformat and standardize the purchase dates to an acceptable format for BigQuery dates
    COALESCE(
      SAFE.PARSE_DATE('%m/%d/%Y', purchase_ts), -- Convert date string
      SAFE.PARSE_DATE('%m-%d-%Y', REGEXP_EXTRACT(purchase_ts, r'^\d{2}-\d{2}-\d{4}')) -- Convert timestamp string
    ) AS cleaned_purchase_date,

    product_id,

    -- Clean and standardize the inconsistent product names
    CASE
      WHEN product_name = '27in 4K gaming monitor' THEN '27 Inch 4K Gaming Monitor'
      WHEN product_name = '27in"" 4k gaming monitor' THEN '27 Inch 4K Gaming Monitor'
      WHEN product_name = 'bose soundsport headphones' THEN 'Bose Soundsport Headphones'
      ELSE product_name
    END AS cleaned_product_name,

    usd_price,
    local_price,

    -- Classify currency nulls as Unknown
    COALESCE(currency, 'Unknown') AS cleaned_currency,

    purchase_platform
FROM core.orders
QUALIFY ROW_NUMBER() OVER(
    PARTITION BY `id`
    ORDER BY cleaned_purchase_date) = 1 -- Deduplicate by id
)

SELECT *
FROM cleaned_orders_table
;


-- 2) Clean customers table

WITH cleaned_customers_table AS (
  SELECT
    `id`,

    -- Classify marketing channel nulls and empties as unknown
    CASE 
      WHEN marketing_channel IS NULL OR marketing_channel = ' ' THEN 'unknown' 
      ELSE marketing_channel 
    END AS cleaned_marketing_channel,

    -- Classify account creation method nulls and empties as unknown
    CASE 
      WHEN account_creation_method IS NULL OR account_creation_method = ' ' THEN 'unknown' 
      ELSE account_creation_method 
    END AS cleaned_account_creation_method,

    -- Classify country code nulls as UNK
    COALESCE(country_code, 'UNK') AS cleaned_country_code,

    -- Classify country name nulls as Unknown
    COALESCE(country_name, 'Unknown') AS cleaned_country_name,

    loyalty_program,
    account_created_on
FROM core.customers
QUALIFY ROW_NUMBER() OVER(
    PARTITION BY `id`
    ORDER BY account_created_on) = 1 -- Deduplicate by id
)

SELECT *
FROM cleaned_customers_table
;


-- 3) Clean order status table

WITH cleaned_order_status_table AS (
  SELECT
    order_id,

    -- Reformat and standardize the purchase dates to an acceptable format for BigQuery dates
    COALESCE(
      SAFE.PARSE_DATE('%m/%d/%Y', purchase_ts), -- Convert date string
      SAFE.PARSE_DATE('%m-%d-%Y', REGEXP_EXTRACT(purchase_ts, r'^\d{2}-\d{2}-\d{4}')) -- Convert timestamp string
    ) AS cleaned_purchase_date,

    ship_ts AS ship_date,
    delivery_ts AS delivery_date,
    refund_ts AS refund_date
FROM core.order_status
QUALIFY ROW_NUMBER() OVER(
    PARTITION BY order_id
    ORDER BY cleaned_purchase_date) = 1 -- Deduplicate by order_id
)

SELECT
  order_id,
  cleaned_purchase_date,
  ship_date,
  delivery_date,

    -- Adding metrics for shipping and delivery efficency. Negative durations were discovered, rendered as null, and documented in the issues log.
  CASE
    WHEN DATE_DIFF(ship_date, cleaned_purchase_date, DAY) < 0 THEN NULL
    ELSE DATE_DIFF(ship_date, cleaned_purchase_date, DAY)
  END AS days_to_ship,

  CASE
    WHEN DATE_DIFF(delivery_date, cleaned_purchase_date, DAY) < 0 THEN NULL
    ELSE DATE_DIFF(delivery_date, cleaned_purchase_date, DAY)
  END AS days_to_delivery,

  refund_date,

    -- Adding refund true/false binary metric
  CASE
    WHEN refund_date IS NOT NULL THEN 1
    ELSE 0
  END AS refunded
FROM cleaned_order_status_table
;
