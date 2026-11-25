-- S-007: 顧客IDが'CS018205000001'、かつ売上金額が1,000以上2,000以下のデータを抽出
-- 別解: AND amount BETWEEN 1000 AND 2000（両端を含む）
SELECT sales_ymd, customer_id, product_cd, amount
FROM receipt
WHERE customer_id = 'CS018205000001'
AND amount <= 2000
AND amount >= 1000
