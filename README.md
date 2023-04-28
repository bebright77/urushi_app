# テーブル設計

##　users_table
| column             | type    | options                   | 
|:-------------------|--------:|:-------------------------:| 
| last_name_kanji    | string  | null: false               | 
| first_name_kanji   | string  | null: false               | 
| last_name_kana     | string  | null: false               | 
| first_name_kana    | string  | null: false               |
| email              | string  | null: false, unique: true | 
| encrypted_password | string  | null: false               |

### Association
- has_many :items
- has_many :orders
- has_many :favorites

## items_table
| cloumn            | type        | option                          |
| ----------------- | ----------  |-------------------------------- |
| item_name         | string      |  null: false                    |
| concept           | text        |  null: false                    |
| material          | text        |  null: false
| category_id       | integer     |  null: false                    |
| price             | integer     |  null: false                    | 
| user              | references  |  null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :order


## order_table
| cloumn         |  type      | option                         |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses_table
| cloumn          | type       | option                          | 
| --------------- | ---------- | ------------------------------- | 
| postal_code     | string     |  null: false                    |
| prefectures_id  | integer    |  null: false                    |
| municipality    | string     |  null: false                    |
| address         | string     |  null: false                    |
| building        | string     |                                 |
| phone_number    | string     |  null: false                    | 
| order           | references |  null: false, foreign_key: true |

# アプリケーション名  
urushi

# アプリケーション概要  
美術品をオンラインで展示・販売ができるECサイト

# URL  
https://urushi-app.onrender.com

# テスト用アカウント  
* Basic認証ID: admin
* Basicパスワード: 2222
* メールアドレス: taro@gmail.com

* パスワード: 123abc
# 利用方法
## 作品を登録し展示・販売をする
* トップページ(一覧ページ)のヘッダーから新規登録orログインをする
* 作品登録ボタンを押す
* 各項目を入力し登録する

## 作品を見て購入をする
* 一覧表示やスライドショーを見て気に入った作品をクリックし詳細ページに遷移する
* 詳細ページの購入するボタンを押す
* クレジットカード情報や住所等の項目を入力し購入をクリックする

# アプリケーションを作成した背景
漆芸家、画家の義父は、漆を使ったアクセサリーや水彩画などを作っている。
展示・販売するために、展覧会を時々行っているが、頻繁にはできないという課題があった。

具体的には、以下の様な課題があった。

①出展料がかかる

②場所時間が限られる

③準備が大変

そこで、オンラインで作品の展示・販売ができるECサイトを作成した

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1fEYlB0V57DQP-rnWyZgshyOGUNS56_5JK6GBtHRBeqg/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明
## スライドショー
<!-- [トップページのスライドショー](リンク)
[スライドショーから詳細ページへ遷移する]( リンク ) -->
* スライドショーは出品中の作品を表示している
* スライドショーの写真をクリックした場合でもその作品の詳細ページに遷移することができる
## 一覧表示
<!-- [一覧表示]( リンク ) -->
* 一覧表示には出品中の作品のみ表示し売却済みの作品は非表示にしている
* 一覧表示には写真・作品名・カテゴリー・価格が表示される

## 作品登録機能
* トップページの作品登録ボタンを押すと作品登録のフォームが表示される
* 写真・作品名・コンセプト・素材・カテゴリー・価格が入力必須になっている
* 各項目を埋めなければエラーメッセージが表示され保存されない

##　ユーザー管理機能
* トップページのユーザー登録ボタンを押すとユーザー登録のフォームが表示される
* 氏名を漢字・読みカナ・メールアドレス・パスワード・確認用パスワードが必須項目になっている
* 各項目を埋めなければエラーメッセージが表示され登録できない

## 詳細表示
<!-- [詳細表示](リンク) -->
* 詳細ページには写真・価格・コンセプト・素材が表示される
* 作品の編集・削除ボタンが表示される

## 編集機能
* 編集ボタンを押すと作品登録と同様のフォームが表示される
* フォームを入力し編集ボタンを押すと再度詳細ページが表示され編集した内容で表示される
* 変更した項目がない場合でも空などにはならず変更なく詳細ページが表示される

## 削除機能
* 詳細ページの削除ボタンを押すと該当の作品が削除できる
* 削除後はトップページへ遷移する

## 購入機能
* 詳細ページの購入ボタンを押すと購入のフォームが表示される
* クレジットカードを使用し購入することができる
* 住所を入れ配送先を指定できる
* カード番号・有効期限・セキュリティコード・郵便番号・都道府県・市区町村・番地・電話番号が必須項目になっており各項目を入力すると購入できる
* 建物名は空でも入力しても購入できる
* 必須項目が空だった場合はエラーメッセージが表示され購入できない

# 実装予定の機能
* セキュリティの強化
* 一般ユーザー(顧客)には作品管理機能関連ボタンの非表示、管理者のみアクセス可能にする
* お気に入り機能、カート機能
* ユーザー登録をしたユーザーは住所の入力をしなくても良い

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/d2af615ec97ed1aafe3ad685c9725526.png)](https://gyazo.com/d2af615ec97ed1aafe3ad685c9725526)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/578f08f0c377d6002d510fbf3b751319.png)](https://gyazo.com/578f08f0c377d6002d510fbf3b751319)

# 開発環境
* フロントエンド
* バックエンド
* テキストエディタ
* タスク管理

# ローカルでの動作方法
以下のコマンドを順に実行

% git clone https://github.com/bebright77/urushi_app

% cd urushi

% bundle install

% yarn install

# 工夫したポイント
①色合いは白や薄い青を基調のシンプルなデザインに統一し、作品が映えるように設計した

②過去に、自身がECサイトを利用した際に、スライドショーの写真の商品が気に入ってスライドショーをクリックしても、その商品とは関係のないページに遷移してしまい、欲しいと思った商品の購入に辿り着けなかった経験があった。
そこで、スライドショーの写真からも購入できるようにしたいと考えていたためこのような仕様とした。

③作品が細部まで見られるように写真は大きく表示した

④義父が運用や閲覧する際に見やすいよう文字は大きめにした