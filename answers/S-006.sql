-- S-006: 顧客IDが'CS018205000001'、かつ（売上金額1,000以上 または 売上数量5以上）のデータを抽出
-- ORをカッコで囲み、ANDより先に評価させている
SELECT sales_ymd, customer_id, product_cd, quantity, amount
FROM receipt
WHERE customer_id = 'CS018205000001'
AND(
amount >= 1000
OR
quantity >= 5
)
