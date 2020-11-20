# ブランチを切る
- masterを最新状態に
```ruby
git pull
```
### commit名
- fix：バグ修正
- add：新規（ファイル）機能追加
- update：機能修正（バグではない）
- remove：削除（ファイル）

# レビュー
- rubocopを実行する 
```ruby
bundle exec rubocop -a
```
- リモートリポジトリへpushする
- Pull Requestを出す
- TrelloのカードをPullRequestへ移す
- 全員からレビューをもらう
- masterブランチへmergeする
- Trelloのカードをmergeへ移す

# データベース

## users table

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| nickname        | string  | null: false |

### Association

- has_many :categories
- has_many :shares

## categories table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| category_id | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :shares

## shares table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| share_url   | string     | null: false                    |
| text        | string     | null: false                    | 
| user_id     | references | null: false, foreign_key: true |
| category_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category