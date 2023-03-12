# チートシート

## 基本操作系

### カーソル移動

- [n]h, j, k, l 四方移動
- [n]gj, gk 折り返しの上下移動
- H, M, L 画面上の最上, 中央, 最下に移動
- [n]w, b 次の単語, 前の単語に移動
- [n]W, B スペース区切りの次の単語, 前の単語に移動
- 0, $ 行頭, 行末に移動
- gg, G 1 行目に移動, 最後の行に移動
- [n]G n 行目に移動
- % 対応する括弧に移動

### ページ移動

- <C-d>, <C-u> 半ページ次, 半ページ前に移動

### カット&ヤンク&ペースト

- [n]dd 行削除
- d0 カーソル位置から行頭まで削除
- d$ カーソル位置から行末まで削除
- dgg カーソル位置から最初まで削除
- dG カーソル位置から最後まで削除
- [n]x 文字削除 Delete
- [n]X 文字削除 BackSpace
- :7,20d 範囲削除

### インサートモード

- [n]gI 行頭にインサートモード
- [n]A 行末にインサートモード
- [n]o 下の行にインサートモード
- [n]O 上の行にインサートモード
- <C-w> 前の単語削除
- <C-u> カーソル位置から行頭まで削除

### ウインドウ

- :sp, :vs ウインドウを横分割, 縦分割
- :qa 全閉じ
- :close 閉じる
- <C-w>o 現在ウインドウ以外閉じる
- <C-w>[J,K,H,L] ウインドウの位置を入れ替え
- <C-w>l, <C-w>h, <C-w>j, <C-w>k 右のウインドウ, 左のウインドウ, 下のウインドウ, 上のウインドウ
- <C-=> ウインドウサイズを等しくする

### キーマップ

- <Leader> space

### バッファ操作

- :bd バッファ閉じる（vim を閉じずにファイルを閉じる）
- :ls 開いているバッファを表示
- :b n 開いているファイルのバッファナンバーを開く
- :%bd 開いているバッファを全て閉じる

### 作業を戻る/進む

- [n]u undo
- [n]<C-r> redo

## 拡張機能系

### cheat sheet

- <Leader>? チートシートを開く
- <Leader>f. チートシートを編集モードで開く

### packer

- :PackerInstall プラグインをインストールする
- :PackerUpdate 追加されたプラグインをインストールし、既存のものは更新する
- :PackerClean 必要無くなったプラグインを削除する
- :PackerSync `PackerClean`->`PackerUpdate`をする
- :PackerCompile 設定ファイルをコンパイルする

### nvim-treesitter

- :checkhealth nvim-treesitter ヘルスチェック

### Comment.nvim

- [count]gcc 1 行コメントアウト
- [count]gbc 複数行コメントアウト

### fern.vim

- E 垂直分割してファイルを開く
- t 新規タブでファイルを開く
- N ファイルを新規作成
- K ディレクトリを新規作成
- D ファイルを削除
- m ファイルを移動
- R ファイル名変更
- - ファイル選択
- C ファイルコピー
- P ペースト
- M ファイルコピーし、ペースト時に元ファイルを削除
- y ファイルパスをコピー
- z ファイル名に合わせてウインドウ幅を広げる
- ! 隠しファイルを表示/非表示

### conflict-marker

- [x 前のコンフリクトへ
- ]x 次のコンフリクトへ
- co 自分の変更を適用 :ConflictMarkerOurselves
- ct 相手の変更を適用 :ConflictMarkerThemselves
- cb 両方を適用 :ConflictMarkerBoth
- cn 適用なし :ConflictMarkerNone

### winresizer

- [n]<C-e> ウインドウリサイズモード
- h j k l 左 下 上 右

### searchx.vim

- ? 検索
- / 検索
- N 前の一致項目に移動
- n 次の一致項目に移動

### fern-preview.vim

- <C-p> 自動ファイルプレビューの on/off
- <C-d> ファイルプレビューのページダウン
- <C-u> ファイルプレビューのページアップ

### barbar.nvim

- nnoremap <silent> <C-s> BufferPick 任意のバッファーを開く
- nnoremap <silent> <Space>bb BufferOrderByBufferNumber バッファ順に並び替え
- nnoremap <silent> <Space>bw BufferOrderByWindowNumber ウインドウ順に並び替え

### debug(dap)

- <F5> debugger 起動
- <F10> step over
- <F11> step into
- <F12> step out
- <leader>b toggle breakpoint
- <leader>d toggle debug ui
- <leader>td debug test

### debug ruby with rdbg

別ターミナルで下記コマンドで起動後にdapでブレークポイントを貼って`<F5>`でデバッガー起動する
`rdbg --open --port 38698 -- <ファイル名.rb>`

### todo-comments.nvim

- <Space>tl TodoLocList TODOのリスト表示
- <Space>tt TodoTelescope TelescopeでTODOのリスト表示

### Mason

- "i" install package
- "u" update package
- "c" check package
- "U" update all packages
- "C" check outdated packages
- "X" uninstall package
- <C-c> cancel installation
