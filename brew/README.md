# brew
自分用のBrewfile管理リポジトリ

## インストール
`brew tap Homebrew/bundle`

## 使用方法
### brewfileの作成
新規作成時や更新時に使うコマンド

`brew bundle dump`

- オプション
  - --force リストファイルを強制上書き
  - --global ホームディレクトリにリストファイル.Brewfileを作成
  - --file 'path/filename' リストファイルを指定
  - --describe 'comment' コメント行にcommentを出力


※ 現在のディレクトリに作成される

### brewfileから一括インストール

`brew bundle`

## 補足

### brew
- Homebrewに正式に登録されたライブラリをインストールできる

### tap
- Homebrew に正式に登録されていないライブラリをインストールできる

### cask
- Google Chrome など，Mac アプリをインストールできる

### mas
- App Store から Mac アプリをインストールできる

## その他コマンド
### cleanup : アプリ・パッケージ一括削除
- Brewfileに記載のないアプリケーションをリスト表示する
- オプション
  - --force リストせずにアンインストール
  - --global ホームディレクトリのリストファイル~/.Brewfileを使用
  - --file 'path/filename' リストファイルを指定

### check : Brewfile記載の内、インストール・アップグレードが必要なものを表示
- オプション
  - --force リストせずにアンインストール
  - --global ホームディレクトリのリストファイル~/.Brewfileを使用
  - --file 'path/filename' リストファイルを指定

### list : Brewfile記載のリストを表示する
- オプション
  - —cask,—taps,—mas,--brews で表示形式指定、defaultが--brews、--allですべて表示
  - --global ホームディレクトリのリストファイル~/.Brewfileを使用
  - --file 'path/filename' リストファイルを指定