
「ユーザー情報」
## Tabel名
・usersテーブル
|Column            |Type   |Options    |
|------------------|-------|-----------|
|nickname          |string |null: false|
|email             |string |null: false|
|password          |string |null: false|
|encrypted_password|string |null: false|
|last_name         |string |null: false|
|first_name        |string |null: false|
|last_name_kana    |string |null: false|
|first_name_kana   |string |null: false|
|birthday          |integer|null: false|collection_select|
### Association
has_many:items
has_many:purchase_records




「商品情報」
## Tabel名
・itemsテーブル
|Column             |Type   |Options    |                 |
|-------------------|-------|-----------|-----------------|
|image              |active_storage|    |                 |画像 
|product            |string |null: false|                 |商品名
|product_description|text   |null: false|                 |商品説明
|category           |string |null: false|collection_select|カテゴリー
|condition          |string |null: false|collection_select|商品の状態
|postage            |string |null: false|collection_select|配送料の負担
|area               |string |null: false|collection_select|発送元の地域
|number_of_days     |string |null: false|collection_select|発送までの日数
|price              |integer|null: false|                 |価格
|user               |references   |foreign_key: true|     |外部キーuser 出品者のid
### Association
belongs_to:user
has_one:purchase_record





「購入記録」
## Tabel名
・purchase_recordsテーブル
|Column             |Type   |Options    |                 |
|-------------------|-------|-----------|-----------------|
|user               |references   |foreign_key: true|     |外部キーuser 購入者のid
### Association
belongs_to:user
has_one:item
has_one:shipping_address






「発送先情報」
## Tabel名
・shipping_addressテーブル
|Column             |Type   |Options    |                 |
|-------------------|-------|-----------|-----------------|
|product            |string |null: false|                 |郵便番号
|product_description|string |null: false|collection_select|都道府県
|category           |string |null: false|                 |市区町村
|condition          |string |null: false|                 |番地
|postage            |string |           |                 |建物名（任意）
|area               |string |null: false|                 |電話番号
### Association
has_one:purchase_record


