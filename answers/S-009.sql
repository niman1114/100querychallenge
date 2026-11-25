-- S-009: NOT (prefecture_cd = '13' OR floor_area > 900) を、結果を変えずに AND で書き換える
-- ド・モルガンの法則: NOT (A OR B) = (NOT A) AND (NOT B)
SELECT * FROM store 
WHERE prefecture_cd <> '13' 
AND floor_area <= 900
