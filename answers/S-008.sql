-- S-008: 顧客IDが'CS018205000001'、かつ商品コードが'P071401019'以外のデータを抽出
-- 1回目: IS NOT 'P071401019' と書いて構文エラー → IS NOT は NULL 専用。値の比較は <>（または !=）
SELECT sales_ymd, customer_id, product_cd, amount
FROM receipt
WHERE customer_id = 'CS018205000001'
AND product_cd <> 'P071401019'
