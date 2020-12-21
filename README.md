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

- has_many :shares


## shares table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| share_url   | string     | null: false                    |
| comment     | text       | null: false                    | 
| category_id | integer    | null: false //active_hash      |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user