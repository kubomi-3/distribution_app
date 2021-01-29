# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

-has_many :subjects
-has_many :comments
-has_many: ans_1
-has_many: ans_2
-has_many: ans_3

## subjects テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| text    | text       |                                |
| user_id | references | null: false, foreign_key: true |

### Association

-has_many: comments
-belongs_to :user
-has_many: ans_1
-has_many: ans_2
-has_many: ans_3

## ans_1 テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| proposition_id | references | null: false, foreign_key: true |

### Association

-belongs_to: user
-belongs_to: subject

## ans_2 テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| proposition_id | references | null: false, foreign_key: true |

### Association

-belongs_to: user
-belongs_to: subject

## ans_3 テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| proposition_id | references | null: false, foreign_key: true |

### Association

-belongs_to: user
-belongs_to: subject

## comments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| proposition_id  | references | null: false, foreign_key: true |
| text            | text       | null: false                    |

### Association

-belongs_to :user
-belongs_to :subject