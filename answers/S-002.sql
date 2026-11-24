-- S-002: receiptから売上年月日、顧客ID、商品コード、売上金額の順に列を指定し10件表示
SELECT 
sales_ymd, customer_id, product_cd, amount
FROM
receipt
LIMIT 10;
