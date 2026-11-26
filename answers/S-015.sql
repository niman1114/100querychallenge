-- S-015: customerからステータスコードの先頭がA〜F、かつ末尾が1〜9のデータを全項目で10件表示
-- 正規表現2つを AND でつないだ解答（正解）
-- 別解（正規表現1つ）: WHERE status_cd ~ '^[A-F].*[1-9]$'（.* は「何文字でもいい」）
SELECT * FROM customer
WHERE status_cd ~ '^[A-F]'
AND status_cd ~ '[1-9]$'
LIMIT 10
