# LOGINシステムシリーズ課題
## 課題要件
- Bootstrapシリーズ課題で作成したアプリに機能を追加する形で実装すること
- LOGINシステムを実装し、Userがログイン、ログアウトできるようにすること
- Userはpassword,name,emailなどのカラムを持っていること
- blogのnew,edit,showアクションにいくにはログインしていなければ行けない状態にすること（下記ヒントあり）
- current_userメソッドを定義しておくこと

## 提出方法
herokuにデプロイ、HerokuとGithubレポジトリのURLを提出。

## 行程
1. Bootstrapシリーズ課題を引き継ぐ。
2. branch作る
3. Userモデルの作成
  - カラムはpassword_digest, name, email
  - ※ログインシステム2を参照
4. `migration`
5. `Validation`の設定
  - :name
    - presence (存在性)
    - length (長さ)
  - :email
    - presence (存在性)
    - length (長さ)
    - アドレスのフォーマット
  - :password
    - presence
    - length
    -
  - ※ログインシステム3,5を参照
4. eメールアドレスの一意性の確保
  - `migration`ファイルの作成。インデックスを追加する。
  - before_saveの設定(小文字として判断)
  - ※ログインシステム4を参照
5. セキュアパスワードの設定(PWのハッシュ化)
  - `gem bcrypt`のインストール
  - `has_secure_password`メソッドの設定
  - ※ログインシステム5を参照
6. usersコントローラーの作成、設定
7. ルーティングの設定
  -※ログインシステム6を参照
8. viewの設定
  1. 登録フォームの作成[text6]
  2. エラーメッセージの設定[text7]
  3. User詳細ページの作成[text8]
9. sessionsコントローラーの作成、設定
  1. routing設定[text9]
  2. ログインフォーム作成[text10]
  3. ログイン処理実装[text11]
10. Headderの再構成
  1. ログイン状態に応じて内容の変化するHeadder[text12]
11. ログアウト処理実装
  1. sessionsコントローラーの設定[text13]
