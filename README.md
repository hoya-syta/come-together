# テーブル設計

## users テーブル

| Column            | Type     | Options     |
| ----------------- | -------- | ----------- |
| last_name         | string   | null: false |
| first_name        | string   | null: false |
| last_name_kana    | string   | null: false |
| first_name_kana   | string   | null: false |
| gender_id         | integer  | null: false |
| prefecture_id     | integer  | null: false |
| city              | string   | ----------- |
| profession_id     | integer  | null: false |
| password          | string   | null: false |
| nickname          | string   | null: false |
| email             | string   | null: false |
| birthday          | datetime | null: false |
| age_id            | integer  | ----------- |
| self_introduction | text     | ----------- |

### Association

- has_many :user_posts
- has_many :posts, through: user_posts
- has_many :messages



## posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| details | text       | null: false                    |
| user    | references | null: false, foreign_key: true |


### Association

- has_many :user_posts
- has_many :users, through: user_posts
- has_many :messages



## user_posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| posts   | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user



## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| posts   | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user
