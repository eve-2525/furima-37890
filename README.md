
「ユーザー情報」
## Tabel名
・usersテーブル
|Column            |Type   |Options    |
|------------------|-------|-----------|
|nickname          |string |null: false|ニックネーム
|email             |string |null: false|unique: true メールアドレス
|encrypted_password|string |null: false|パスワード
|last_name         |string |null: false|名字
|first_name        |string |null: false|名前
|last_name_kana    |string |null: false|名字カナ
|first_name_kana   |string |null: false|名前カナ
|birthday          |date   |null: false|collection_select|生年月日
### Association
has_many:items
has_many:purchase_records




「商品情報」
## Tabel名
・itemsテーブル
|Column             |Type   |Options    |                 |
|-------------------|-------|-----------|-----------------|
|product            |string |null: false|                 |商品名
|product_description|text   |null: false|                 |商品説明
|category_id        |integer|null: false|collection_select|active_hashカテゴリー
|condition_id       |integer|null: false|collection_select|active_hash商品の状態
|postage_id         |integer|null: false|collection_select|active_hash配送料の負担
|area_id            |integer|null: false|collection_select|active_hash発送元の地域 都道府県
|number_of_days_id  |integer|null: false|collection_select|active_hash発送までの日数
|price              |integer|null: false|                 |価格
|user               |references|null: false|foreign_key: true|外部キーuser 出品者のid
### Association
belongs_to:user
has_one:purchase_record (子テーブル)





「購入記録」
## Tabel名
・purchase_recordsテーブル
|Column             |Type   |Options    |                 |
|-------------------|-------|-----------|-----------------|
|user               |references|null: false|foreign_key: true|外部キーuser 購入者のid
|item               |references|null: false|foreign_key: true|外部キーitem 商品情報のid
### Association
belongs_to:user
belongs_to:item (親テーブル)
has_one:shipping_addresses (子テーブル)






「発送先情報」
## Tabel名
・shipping_addressesテーブル
|Column             |Type   |Options    |                 |
|-------------------|-------|-----------|-----------------|
|postal_code        |string |null: false|                 |郵便番号
|area_id            |integer|null: false|collection_select|active_hash受け取り先の地域 都道府県
|city               |string |null: false|                 |市区町村
|block_number       |string |null: false|                 |番地
|building           |string |           |                 |建物名（任意）
|telephone_number   |string |null: false|                 |電話番号
|purchase_record    |references|null: false|foreign_key: true|外部キーpurchase_records 購入記録のid

### Association
belongs_to:purchase_record (親テーブル)