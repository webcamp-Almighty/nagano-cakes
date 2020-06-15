# ながのけーく

長野県にある小さなな洋菓子店「ながのCAKE」の商品を通販するためのECサイト.

# 背景
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。


# 使い方  
インストール方法

$ git clone git@github.com:webcamp-Almighty/nagano-cakes.git(SSH) or<br>
$ git clone https://github.com/webcamp-Almighty/nagano-cakes.git (HTTPS)<br>
$ cd nagano-cakes<br>
$ bundle install<br>
$ rails db:migrate<br>
$ rails db:seed<br>
$ rails s -b 0.0.0.0<br>


*テスト方法
ローカルサーバーにアクセスしてご覧ください。

管理者用アカウント  
メールアドレス：admin@admin.com<br>
パスワード：adminadmin

顧客用アカウント  
メールアドレス：user@admin.com<br>
パスワード：adminadmin

を入力してログインしてください。


 # 実装概要
 
 *ユーザー
1. ログイン機能
・メールアドレス、パスワードでログインできる。 
・ログイン時のみ利用できる機能が利用できるようになる。


2. ログアウト機能
・ログインしている状態からログアウト状態にする。 
・ログイン時のみ利用できる機能が利用できなくなる。

3. 商品一覧表示機能
・商品を一覧表示する。 ・検索結果を表示する場合は、検索条件に当てはまる商品のみ一覧表示する。

4.商品詳細情報表示機能
・商品一覧画面で選択した商品の詳細情報を表示する。 ・カート追加機能が表示されている。

5.カート追加機能
・カートに商品を追加することができる。

6.カート一覧機能
・カートの中身を一覧表示することができる。

7. カート編集機能
・カートの中身の個数を編集したり、削除したりすることができる。

8. 注文機能
・カートの中身の購入をすることができる。 ・支払方法や発送先を設定することができる。

9. 会員情報編集機能
・登録している情報を編集することができる。

10. 退会機能
・退会手続きをすることができる。

11. 配送先追加・編集機能
・登録している配送先を一覧で確認することができる。 ・配送先の新規追加・修正・削除をすることができる。

12. 注文履歴一覧表示機能
・過去の注文概要を一覧で確認することができる。 ・

13. 注文履歴詳細表示機能
・注文の詳細(注文商品や個数など)を確認することができる。


*管理者
1. ログイン機能
・メールアドレス、パスワードでログインできる。 ・ログイン時のみ利用できる機能が利用できるようになる。

2. ログアウト機能
・ログインしている状態からログアウト状態にする。 ・ログイン時のみ利用できる機能が利用できなくなる。

3. 注文履歴一覧表示機能
・過去の注文概要を一覧で確認することができる。

4. 注文履歴詳細表示機能
・注文の詳細(注文商品や個数など)を確認することができる。 ・注文ステータス、製作ステータスを変更することができる。

5. 顧客一覧表示機能
・顧客情報を一覧で確認することができる。

6. 顧客詳細情報表示機能
・顧客の詳細情報を確認することができる。 ・顧客のステータス(有効/退会)を切り替えることができる。

7. 商品一覧表示機能
・登録商品を一覧で確認することができる。

8. 商品詳細情報表示機能
・商品の詳細情報を確認することができる。

9. 商品情報変更機能
・商品の登録情報を変更することができる。 ・販売ステータスを変更することができる。

10. ジャンル設定機能
・ジャンルの追加・変更・ステータス切り替えを行うことができる。


*導入したgem

gem 'devise'  
gem 'bootstrap-sass', '~> 3.4.1'  
gem 'jquery-rails'  
gem "refile", require: "refile/rails", github: 'manfe/refile'  
gem "refile-mini_magick"  
gem 'kaminari','~> 1.2.1'  
gem 'pry-byebug'  
gem 'enum_help'  
gem 'rails-i18n'  
gem 'faker'  
gem 'jp_prefecture'  
gem 'font-awesome-rails'  
gem 'kaminari-bootstrap', '~> 3.0.1'  

 
* 作成者
くりちゃん
たかさん
ずーみん
