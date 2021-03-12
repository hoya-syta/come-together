# アプリケーション名

## Come Together
![](https://gyazo.com/0c607987fd5956c2e63a206ebded14eb.png "top_page")


# アプリケーション概要

### 当アプリケーションは同じ趣味趣向を持った人たちとの繋がり合いを目的とするコミュニティアプリです。

- ユーザー登録をし記事の投稿、また他のユーザーの投稿ページにてメッセージや画像を送り合う事ができます。
- 自分が投稿した記事は編集・削除ができます。
- 投稿した記事はトップページに一覧表示されます。
- 未登録ユーザーやログアウト中のユーザーは投稿されている記事一覧を見る事はできますが、ページに遷移をすることはできません。

## 実装機能一覧
- ユーザー登録機能(新規登録・ログイン)
- 記事投稿機能
- 投稿記事編集・削除機能
- 投稿記事の一覧表示
- 投稿記事検索機能
- 投稿に対するコメント機能


# 使用技術

### フロントエンド
- HTML/CSS

### バックエンド
- Ruby on Rails6.0

### テスト
- Rspec
- Capybara

### データベース
- MySQL

### 本番環境
- AWS(EC2, S3)
- Nginx
- Unicorn
- Capistrano

### 開発環境
- MacOS
- VScode
- Git/GitHub


# URL
http://54.168.25.151/

## テスト用アカウント
- メールアドレス：1234567@mail
- パスワード：abc1234

# 利用方法
### ユーザーアカウントを登録し、記事を投稿または他のユーザーの記事ページに入りコメント等を送りやりとりを行えます。![](https://gyazo.com/c3a63c01ad9ef4ab680a327b67eaf25a.gif )

### 投稿記事のニックネームをクリックすれば、プロフィールページに遷移できます。
![](https://gyazo.com/2b80a57868c511b194706406cdd761c1.gif )

### 検索ボックスに気になるワードを入力しボタンを押せば、投稿一覧からワードに関連する記事を表示してくれます。
![](https://gyazo.com/a0a241891dbfd8d805bb582c4138426d.gif )



# 目指した課題解決
- 音楽のライヴやイベントに行きたいが一人だと心細い人、またイベント終了後の興奮冷めやらぬ気持ちを語りたい人などを対象としたコミュニケーションアプリです。
- 自分の興味あるイベントの記事を作成もしくは検索し、その記事ページ内で同じ意思をもつユーザーとやりとりをして親睦を深めていきます。
- 原則として金銭的なやりとり（チケット売買等）は禁止。あくまでやりとりを通じて一つのイベントについて楽しむことに特価したアプリを目指しています。


# 実装予定の機能
- ユーザーフォロー機能。
- 中間テーブルを用いて、特定の数人でやりとりのできるチャットルームの実装。

# テーブル設計
## Users テーブル

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


## Posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| detail  | text       | null: false                    |
| user    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :user_posts
- has_many   :users, through: user_posts
- has_many   :messages



## User_posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user



## Messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

