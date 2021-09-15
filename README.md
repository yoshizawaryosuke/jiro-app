# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| email              | string | null: false, unique:true|
| encrypted_password | string | null: false             |
| nickname           | string | null: false             |
| noodle_id          | integer | null: false             |
| soup_id            | integer | null: false             |
| meat_id            | integer | null: false             |
| vegetable_id       | integer | null: false             |
| garlic_id          | integer | null: false             |
| oil_id             | integer | null: false             |

### Association

- has_many :items
- has_many :buys

## stores テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| item_text     | text       | null: false                    |
| category_id   | integer    | null: false                    |
| postage_id    | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| scheduled_delivery_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column    | Type       | Options                           |
| --------- | ---------- | --------------------------------- |
| user      | references | null: false, foreign_key: true    |
| item      | references | null: false, foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefeture_id   | integer    | null: false                    |
| city           | string     | null: false                    |
| address_number | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |

### Association

- belongs_to :buy