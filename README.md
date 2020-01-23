# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_rattle|string|null: false|
|last_name_rattle|string|null: false|
|email|string|unique: ture, null: false|
|phone_number|integr|null: false|
|birthyear|integer|null: false|
|birthmonth|integer|null: false|
|birthday|integer|null: false|
|password|string|null: false|
|introduction|text|-------|
|image|text|-------|
|prefecture_id|references|null: false,foreign_key: true|

### Association
- has_many :comments
- has_many :items ,dependent: :destroy
- has_many :trade_messages
- has_many :likes,dependent: :destroy
- has_many :evalutions,dependent: :destroy
- has_one :card
- has_one :point
- has_one :profit
- has_one :address

## users_noticesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|notice_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :notice

## users_todosテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|todo_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :todo



## cardsテーブル
Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_number|integer|null: false|
|year|integer|null: false|
|month|integer|null: false|
|security_number|integer|null: false|

### Association
- belongs_to :user

## evalutionsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|reviewer_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|name|string|null: false|
### Association
- belongs_to :user


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## trade_messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|text|----|------|
### Association
- belongs_to :user
- has_many: items

## profitテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## itemsテーブル
Column|Type|Options|
|------|----|-------|
|seller_id|references|foreign_key: true|
|buyer_id|references|foreign_key: true|
|name|string|null: false, index|
|price|integer|null: false|
|shipping_date|date|null: false|
|condition|string|null: false|
|delivery_method|string|-------|
|region|string|null: false|
|postage|integer|------|


### Association
- belongs_to :user
- belongs_to:brand
- belongs_to:category
- belongs_to:profit
- has_many:trade_messages
- has_many:comments
- has_many:images
- has_many:likes,dependent: :destroy

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|text|null: false|
### Association
- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null,false|
### Association
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false ,unique: true|
|parent_id|references|null: false, foreign_key: true|
### Association
- has_many :items



## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|text|text|null: false|
### Association
- belongs_to :user
- belongs_to :item

## pointsテーブル 
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|zipcode|string|null: false|
|first_address|string|null: false|
|second_address|string|null: false|
|third_address|string|-------|
### Association
- belongs_to :user