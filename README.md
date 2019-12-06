# README

# freemarket_sample_64b DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|e-mail|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|kana_fa_name|string|null: false|
|kana_fi_name|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|dirth_day|integer|null: false|
|phone_number|integer|null: false|
### Association
- has_many :credits, dependent: :destroy
- has_many :snses, dependent: :destroy
- has_many :addresses, dependent: :destroy
- has_many :items, through: :comments, dependent: :destroy
- has_many :comments, dependent: :destroy

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|null: false|
|phone_number|integer||
### Association
- belongs_to :user

## snsesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|name|string|null: false|
|token|string|null: false|
### Association
- belongs_to :user

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|card_number|integer|null: false|
|pin_number|integer|null: false|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|seller_id|references|null: false,foreign_key: true|
|buyer_id|references|null: false,foreign_key: true|
|category_id|references|null: false,foreign_key: true|
|brand_id|references|null: false,foreign_key: true|
|size|string||
|status|string|null: false|
|send_burden|string|null: false|
|send_plan|string|null: false|
|delivery_source|string|null: false|
|send_day|string|null: false|
|description|text|null: false|
### Association
- belongs_to :brand
- belongs_to :category
- has_many :images
- has_many :users, through: :comments, dependent: :destroy
- has_many :comments, dependent: :destroy

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|item_id|references|null: false,foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|item_id|references|null: false,foreign_key: true|
### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :items
