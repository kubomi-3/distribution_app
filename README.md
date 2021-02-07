# アプリケーション名

Distribution_app(集計アプリ)

# 概要

集計を取りたい題材を投稿し、他のユーザーに投票してもらうことで様々なものの集計を取ることができる。  
マイページに自身が今までに投稿した題材や題材に対して選択した投票を表示し、自己把握や自己PR,様々なユーザーの分析などをすることができる。

# 本番環境

https://distribution-app.herokuapp.com/  

ログイン情報（テスト用）
- Eメール：nobita@sample
- パスワード：111aaa

# 制作背景(意図)

  様々なものの統計を取りたいと考え、作成し始めました。例えば好き色の割合や神の存在を信じる者の割合、
また様々な意見や考えに対する見解の割合など世界の様々な人がどのように考え自身はどこに属するのか、
を知ることができると面白いのではないかと思っています。またその集計を他にも利用できないかと考え、
マイページを作成しました。これからはネット上で他者と知り合うことも多くなるのではないかと考えており、
Twitterなど自ら発信していなくても投票するだけで多彩かつ多くの題材に対する自身の考えを示すことができ、
簡単に自己PRや他者を知ることができるのではないかと考えています。

# DEMO

## トップページ
![demo](https://user-images.githubusercontent.com/75615431/106873374-bc89fa80-6717-11eb-8ce8-81d7be4c560f.mp4)

投稿された題材のタイトルが一覧で表示されます。題材をクリックすると題材詳細画面へ遷移します。

## 題材詳細ページ
![demo](https://user-images.githubusercontent.com/75615431/106875119-a846fd00-6719-11eb-8d91-86a9596bbe75.mp4)

詳細ページでは投票ができ、投票すると投票結果とコメントフォームが表示されます。

## マイページ
![demo](https://user-images.githubusercontent.com/75615431/106875910-87cb7280-671a-11eb-8738-8c4cb6b594b2.png)

マイページでは今までに投稿した題材や投票した題材の選択が表示されており、題材をクリックするとその詳細ページに遷移します。  
またコメントを書いた題材に対しては（コメント有）と表示されています。

# 工夫したポイント

  このアプリにおいて最も大切なものの一つは正確性だと考えています。なのでユーザー登録をしないと投票はできず、
投票は一回のみできるようにしました。また投票結果が先に表示されてしまうとそれに左右されてしまうかもしれないと考え、
投票後に結果を表示するようにしました。コメントに関しても表示しない方がいいと考えたのですが、
コメントを見てから結果を見るというのも面白いのではないかと思い現段階では投票前でも表示しています。

# 使用技術

## バックエンド

Ruby, Ruby on Rails

## フロントエンド

HTML, CSS

## データベース

MySQL, SequelPro

## サーバ（本番環境）

Heroku

## ソース管理

GitHub, GitHubDesktop

## エディタ

VSCode

# 課題や今後実装したい機能

今後実装したい機能  
・画像で問うこともできるようにしたいので画像投稿機能  
・知りたい題材を簡単に見つけられるようにするために検索機能  
・コメントに対する反響をを可視化するために「グッド、バッド」ボタンを作成  
・性別や年齢などユーザー情報を増やすことでより詳細な集計を取ることができるのでユーザー情報の追加  
・ヘッダーのカラーをランダムで表示するようにする。これはちょっとした遊び心ともし色によって気持ちが
変わるのであればそれをユーザーに気づいてもらい、その上でより冷静になってもらうため。  

課題  
・マイページでは投票した題材とその選択した記号のみが表示されているため、マイページのみでは題材に対する
考えがわからずわざわざ題材詳細ページで確認しなければならないのでマイページだけで分かるようしたい。  
・選択肢の数を増やすことはできるが現状においても、２択で問いたい場合でも３択の選択肢が表示されてしまい
ユーザーの任意で選択肢の数を指定することができない。

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :subjects
- has_many :comments
- has_many :ans_1
- has_many :ans_2
- has_many :ans_3

## subjects テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| text    | text       |                                |
| user_id | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_many :ans_1
- has_many :ans_2
- has_many :ans_3

## ans_1s テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| subject_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :subject

## ans_2s テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| subject_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :subject

## ans_3s テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| subject_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :subject

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| subject_id  | references | null: false, foreign_key: true |
| text        | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :subject