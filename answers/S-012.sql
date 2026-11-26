-- S-012: storeから住所に'横浜市'が含まれるものだけ全項目を表示
-- 1回目: IN '横浜市' → 構文エラー（IN は候補一覧 ('a','b') との完全一致用）
-- 「含む」は前後に % を付けた LIKE '%横浜市%'
SELECT * FROM store 
WHERE address LIKE '%横浜市%'
