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
|phone|integer|null: false|
### Association
- has_many :items
- has_many :images
- has_many :credits
- has_many :snses
- has_many :addresses
- has_many :items, through: :comments

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|null: false|
|phone|integer||
### Association
- belongs_to :user

## snsesテーブル
|Column|Type|Options|
|------|----|-------|
|sns_name|string|null: false|
|sns_token|string|null: false|
### Association
- belongs_to :user

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|credit_name|string|null: false|
|card_namber|integer|null: false|
|pin_namber|integer|null: false|
### Association
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_name|string||
|post_id|references|null: false,foreign_key: true|
|user_id|references|null: false,foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|item_price|string|null: false|
|user_id|references|null: false,foreign_key: true|
|category_id|references|null: false,foreign_key: true|
|brand_id|references|null: false,foreign_key: true|
|item_size|string||
|item_status|string|null: false|
|send_burden|string|null: false|
|send_plan|string|null: false|
|delivery_source|string|null: false|
|send_day|string|null: false|
|item_description|text|null: false|
### Association
- has_many :images
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :users, through: :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|item_id|references|null: false,foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|item_id|references|null: false,foreign_key: true|
### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_name|string||
|brand-group_id|references|null: false,foreign_key: true|
### Association
- has_many :items
- has_many :brand-groups
- has_many :brand-groups, through: :brands_brand-groups

## brand-groupsテーブル
|Column|Type|Options|
|------|----|-------|
|group_name|string||
### Association
- has_many :brands
- has_many :brands, through: :brands_brand-groups