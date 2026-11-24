-- S-004: receiptから売上日、顧客ID、商品コード、売上金額を、顧客IDが'CS018205000001'の条件で抽出
-- 1回目は "CS018205000001"（ダブルクォート）にして列名扱いのエラー → シングルクォートに修正
SELECT sales_ymd, customer_id, product_cd, amount FROM receipt WHERE customer_id = 'CS018205000001'
