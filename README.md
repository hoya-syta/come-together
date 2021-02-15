# アプリケーション名

## Come Together

# アプリケーション概要

- ユーザー登録をし記事の投稿、また他のユーザーの投稿ページにてメッセージや画像を送り合う事ができる。
- 自分が投稿した記事は編集・削除ができる。
- 投稿した記事はトップページに一覧表示される。
- メッセージや投稿に対していいね！をする事ができたり気になったユーザーはフォローする事ができる。
- 未登録ユーザーやログアウト中のユーザーは投稿されている記事一覧は見る事ができるが、ページに遷移をすることはできない。


# URL

# テスト用アカウント

# 利用方法
- ユーザーアカウントを登録し、記事を投稿または他のユーザーの記事ページに入りコメント等を送りやりとりを行う。

# 目指した課題解決
- 音楽のライヴやイベントに行きたいが一人だと心細い人、またイベント終了後の興奮冷めやらぬ気持ちを語りたい人などを対象としたコミュニケーションアプリである。
- 自分の興味あるイベントの記事を作成もしくは検索し、その記事ページ内で同じ意思をもつユーザーとやりとりをしていく。
- 原則として金銭的なやりとり（チケット売買等）は禁止。あくまでやりとりを通じて一つのイベントについて楽しむことに特価したアプリを目指している。

# 洗い出した要件

# 機能の説明

# 実装予定の機能

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
| age_id            | integer  | null: false |
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

# ローカルでの動作方法
