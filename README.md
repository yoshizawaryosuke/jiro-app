# 二郎アプリ
二郎初心者の方でも安心して来店出来るようになるアプリです！

# アプリケーション概要
二郎と一言で言っても麺の硬さや、スープの乳化度合いに差があります。
自分の好みの店や、コールの仕方をSNSや、クチコミサイトで見つける必要があります。
ユーザー毎の好みや店舗毎の特徴を登録する事で、自分の好みと同じユーザーが紹介したお店に行ったり
自分好みの店舗を探して行く事が出来ます。


# テーブル設計

## users テーブル

| Column             | Type    | Options                 |
| ------------------ | ------  | ----------------------- |
| email              | string  | null: false, unique:true|
| encrypted_password | string  | null: false             |
| nickname           | string  | null: false             |
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

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| store_name         | string     | null: false                    |
| store_text         | text       | null: false                    |
| store_noodle_id    | integer    | null: false                    |
| store_soup_id      | integer    | null: false                    |
| store_meat_id      | integer    | null: false                    |
| store_vegetable_id | integer    | null: false                    |
| store_garlic_id    | integer    | null: false                    |
| store_oil_id       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column       | Type       | Options                           |
| ------------ | ---------- | --------------------------------- |
| user         | references | null: false, foreign_key: true    |
| item         | references | null: false, foreign_key: true    |
| comment_text | text       | null: false                       |

### Association

- belongs_to :user
- belongs_to :store
