--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--

-- -----------------------------------
-- Neovim本体の基本設定
-- -----------------------------------

local opt = vim.opt

-- 文字コードの設定
opt.encoding = 'utf-8'
-- ヘルプの言語
opt.helplang = 'ja,en'

-- カーソル位置の表示
opt.ruler = true
-- 行番号の表示
opt.number = true
-- 相対行番号の表示
opt.relativenumber = true

-- 行末の1文字先までカーソルを移動できるように
opt.virtualedit = 'onemore'
-- 改行時の自動インデント
opt.autoindent = true

-- 画面の水平分割時に下側に表示
opt.splitbelow = true
-- 画面の垂直分割時に右側に表示
opt.splitright = true
-- コマンドモードの補完
opt.wildmenu = true
-- 画面端でのスクロール開始位置の設定
opt.scrolloff = 30

-- バックアップファイルを作成しない
opt.backup = false
-- スワップファイルを作成しない
opt.swapfile = false
-- 編集中のファイルが変更されたら自動で読み直す
opt.autoread = true
-- バッファが編集中でもその他のファイルを開けるようにする
opt.hidden = true

-- 入力中のコマンドをstatus lineに表示する
opt.showcmd = true


-- 現在の行を強調表示しない
opt.cursorline = false
opt.cursorcolumn = false
-- highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

-- 検索した文字列をハイライトする
opt.hls = true
opt.laststatus = 3
-- 長い行を折り返して表示
opt.wrap = true

-- Tab setting
-- C言語likeなインデント維持(`{}`によってインデントを決める)
opt.smartindent = true
-- 現在の行のインデントを維持する
opt.autoindent = true
-- tab半角スペースの数
opt.tabstop = 4
-- tabを複数のspaceに置換
opt.expandtab = false
-- tabの幅
opt.shiftwidth = 4

-- ファイルタイプごとのタブ設定
vim.cmd([[
	autocmd FileType cpp setlocal tabstop=2 shiftwidth=2
	autocmd FileType ruby setlocal tabstop=2 shiftwidth=2
	autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
	autocmd FileType typescript setlocal tabstop=2 shiftwidth=2
	autocmd FileType javascriptreact setlocal tabstop=2 shiftwidth=2
	autocmd FileType typescriptreact setlocal tabstop=2 shiftwidth=2
	autocmd FileType jsonc setlocal tabstop=2 shiftwidth=2
	autocmd FileType graphql setlocal tabstop=2 shiftwidth=2
	autocmd FileType terraform setlocal tabstop=2 shiftwidth=2
	autocmd FileType sh setlocal tabstop=2 shiftwidth=2
	autocmd FileType toml setlocal tabstop=2 shiftwidth=2
	autocmd FileType markdown setlocal tabstop=2 shiftwidth=2
]])

-- 全てのjsonファイルをjsoncとして扱うようにする
-- jsoncとして扱うことでcocのコメントアウト構文エラーが出力されないようにする
vim.cmd([[
	augroup JsonToJsonc
    	autocmd! FileType json set filetype=jsonc
	augroup END
]])

-- floating windowを半透明にする
opt.termguicolors = true
opt.pumblend = 20
opt.winblend = 20

-- タブページを常に表示
opt.showtabline = 2

-- マウス操作
opt.mouse = 'a'
opt.clipboard = 'unnamed'

-- spelunker.vimの機能を使うためspell checkをoff
opt.spell = false

-- lsp,breakpoint,diffをcolumnnumberの横に常に表示する
opt.signcolumn = 'yes:1'
