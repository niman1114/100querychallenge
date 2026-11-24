-- S-003: S-002の条件で、sales_ymdをsales_dateに項目名を変更して抽出
SELECT sales_ymd AS sales_date, customer_id, product_cd, amount
FROM receipt
LIMIT 10;
