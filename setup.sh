#!/bin/bash
# データサイエンス100本ノック（SQL）用の環境構築スクリプト
# 新しいセッションで最初に1回実行する: bash setup.sh
set -euo pipefail

UPSTREAM=https://github.com/rootassist/100knocks-preprocess-inSQLandPython-withColab.git
WORK=${WORK:-/tmp/100knocks}
DB=dsdojo_db

# 1. 元リポジトリ（問題・データ）を取得
if [ ! -d "$WORK/upstream" ]; then
  mkdir -p "$WORK"
  git clone --depth 1 "$UPSTREAM" "$WORK/upstream"
fi
DATA="$WORK/upstream/docker/work/data"
chmod -R a+rX "$WORK"

# 2. PostgreSQL を起動
service postgresql start >/dev/null
until su postgres -c "pg_isready -q"; do sleep 1; done

# 3. DB作成（既にあれば作り直し）
su postgres -c "psql -q -c 'DROP DATABASE IF EXISTS $DB;' -c 'CREATE DATABASE $DB;'"

# 4. テーブル作成（元リポジトリの定義どおり）
su postgres -c "psql -q -v ON_ERROR_STOP=1 -d $DB" <<'EOSQL'
create table customer(
  customer_id VARCHAR(14), customer_name VARCHAR(20), gender_cd VARCHAR(1),
  gender VARCHAR(2), birth_day DATE, age INTEGER, postal_cd VARCHAR(8),
  address VARCHAR(128), application_store_cd VARCHAR(6),
  application_date VARCHAR(8), status_cd VARCHAR(12),
  primary key (customer_id));
create table category(
  category_major_cd VARCHAR(2), category_major_name VARCHAR(32),
  category_medium_cd VARCHAR(4), category_medium_name VARCHAR(32),
  category_small_cd VARCHAR(6), category_small_name VARCHAR(32),
  primary key (category_small_cd));
create table product(
  product_cd VARCHAR(10), category_major_cd VARCHAR(2),
  category_medium_cd VARCHAR(4), category_small_cd VARCHAR(6),
  unit_price INTEGER, unit_cost INTEGER,
  primary key (product_cd));
create table store(
  store_cd VARCHAR(6), store_name VARCHAR(128), prefecture_cd VARCHAR(2),
  prefecture VARCHAR(5), address VARCHAR(128), address_kana VARCHAR(128),
  tel_no VARCHAR(20), longitude NUMERIC, latitude NUMERIC, floor_area NUMERIC,
  primary key (store_cd));
create table receipt(
  sales_ymd INTEGER, sales_epoch INTEGER, store_cd VARCHAR(6),
  receipt_no SMALLINT, receipt_sub_no SMALLINT, customer_id VARCHAR(14),
  product_cd VARCHAR(10), quantity INTEGER, amount INTEGER,
  primary key (sales_ymd, store_cd, receipt_no, receipt_sub_no));
create table geocode(
  postal_cd VARCHAR(8), prefecture VARCHAR(4), city VARCHAR(30),
  town VARCHAR(30), street VARCHAR(30), address VARCHAR(30),
  full_address VARCHAR(80), longitude NUMERIC, latitude NUMERIC);
EOSQL

# 5. データ投入
for t in customer category product store receipt geocode; do
  su postgres -c "psql -q -v ON_ERROR_STOP=1 -d $DB -c \"\\copy $t FROM '$DATA/$t.csv' WITH CSV HEADER\""
done

# 6. 件数確認
su postgres -c "psql -d $DB -c \"
select 'customer' t, count(*) from customer union all
select 'category', count(*) from category union all
select 'product', count(*) from product union all
select 'store', count(*) from store union all
select 'receipt', count(*) from receipt union all
select 'geocode', count(*) from geocode;\""
echo "セットアップ完了: su postgres -c 'psql -d $DB'"
