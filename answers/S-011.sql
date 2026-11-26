-- S-011: customerから顧客IDの末尾が1のものだけ全項目を10件表示
-- '%1' = 「何文字でもいい ＋ 最後が1」
SELECT * FROM customer
WHERE customer_id LIKE '%1'
LIMIT 10
