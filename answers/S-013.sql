-- S-013: customerからステータスコードの先頭がA〜Fのデータを全項目で10件表示
-- LIKE を OR で6つつないだ解答（正解）
-- 別解（正規表現）: WHERE status_cd ~ '^[A-F]'
SELECT * FROM customer
WHERE status_cd LIKE 'A%'
OR status_cd LIKE 'B%'
OR status_cd LIKE 'C%'
OR status_cd LIKE 'D%'
OR status_cd LIKE 'E%'
OR status_cd LIKE 'F%'
LIMIT 10
