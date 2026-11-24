-- S-005: S-004の条件に加えて、売上金額が1,000以上のデータを抽出
-- 1回目: 条件の後ろに不要なカンマ、「以上」を => と書いていた → カンマ削除、>= に修正
SELECT sales_ymd, customer_id, product_cd, amount FROM receipt
WHERE customer_id = 'CS018205000001'
AND amount >= 1000
