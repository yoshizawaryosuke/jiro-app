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

- has_many :stores
- has_many :comments

## stores テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| store_name     | string     | null: false                    |
| store_text     | text       | null: false                    |
| store_noodle_id   | integer    | null: false                    |
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
