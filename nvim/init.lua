local opt = vim.opt
local keymap = vim.api.nvim_set_keymap

-- 基本設定
-- エディタ
opt.encoding = 'utf-8' -- 文字コードをUTF-8に設定
opt.helplang = 'ja,en' -- ヘルプの言語

opt.ruler = true -- カーソル位置を表示
opt.number = true -- 行番号を表示
opt.relativenumber = true -- 相対行番号を表示

opt.virtualedit = 'onemore' -- 行末の1文字先までカーソルを移動できるように
opt.autoindent = true -- 改行時に自動インデント

opt.splitbelow = true -- 画面を水平分割時に下に表示
opt.splitright = true -- 画面を垂直分割時に右に表示
opt.wildmenu = true -- コマンドモードの補完
opt.scrolloff = 30 -- 画面端でのスクロール位置指定

opt.backup = false -- バックアップファイルを作らない
opt.swapfile = false -- スワップファイルを作らない
opt.autoread = true -- 編集中のファイルが変更されたら自動で読み直す
opt.hidden = true -- バッファが編集中でもその他のファイルを開けるようにする

opt.showcmd = true -- 入力中のコマンドをステータスに表示する


-- 見た目系
-- opt.cursorline = true -- 現在の行を強調表示
-- highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
-- set cursorcolumn = true
opt.hls = true -- 検索した文字列をハイライトする
opt.laststatus = 3
opt.wrap = true -- 長い行を折り返して表示

-- tab setting
opt.smartindent = true -- C言語likeなインデント維持(`{}`によってインデントを決める)
opt.autoindent = true -- 現在の行のインデントを維持する
opt.tabstop = 4 -- tab半角スペースの数
opt.expandtab = false -- tabを複数のspaceに置換
opt.shiftwidth = 4 -- tabの幅

-- ファイルタイプごとのタブ設定
vim.cmd([[
	autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2
	autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2
	autocmd Filetype javascriptreact setlocal tabstop=2 shiftwidth=2
	autocmd Filetype typescriptreact setlocal tabstop=2 shiftwidth=2
	autocmd Filetype jsonc setlocal tabstop=2 shiftwidth=2
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
opt.pumblend = 10
opt.winblend = 10

-- タブページを常に表示
opt.showtabline = 2

-- マウス操作
opt.mouse = 'a'
opt.clipboard = 'unnamed'

-- spell check
opt.spell = false -- spelunker.vimの機能を使うためoff

-- Emacs move
keymap('i', '<C-p>', '<Up>', {})
keymap('i', '<C-n>', '<Down>', {})
keymap('i', '<C-b>', '<Left>', {})
keymap('i', '<C-f>', '<Right>', {})
keymap('i', '<C-a>', '<Home>', {})
keymap('i', '<C-e>', '<End>', {})
keymap('i', '<C-d>', '<Del>', {})
keymap('i', '<C-h>', '<BS>', {})
keymap('i', '<C-k>', '<Esc>D', {})
keymap('i', '<C-u>', '<Esc>dd', {})

-- ターミナルの移動
keymap('t', '<C-p>', '<Up>', { noremap = true })
keymap('t', '<C-n>', '<Down>', { noremap = true })
keymap('t', '<C-b>', '<Left>', { noremap = true })
keymap('t', '<C-f>', '<Right>', { noremap = true })
keymap('t', '<C-d>', '<Del>', { noremap = true })
keymap('t', '<C-h>', '<BS>', { noremap = true })

-- バッファ操作
keymap('n', '<C-[', ':bprev<CR>', { noremap = true, silent = true })
keymap('n', '<C-]', ':bnext<CR>', { noremap = true, silent = true })

-- space keyにleaderキーを割り当てる
vim.g.mapleader = ' '
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable') -- シンタックス有効化

vim.cmd([[
	" ノーマルモード切り替え時に日本語入力をoffにする
	function! s:disableIme()
    	if has('mac')
        	call jobstart(['osascript', '-e', 'tell application "System Events" to key code {102}'], {'in_io': 'null', 'out_io': 'null', 'err_io': 'null'})
    	endif
	endfunction

	" 日本語入力から半角入力のノーマルモードへ抜ける。ｊｋ
	inoremap <silent> jk <C-o>:call <SID>disableIme()<CR><ESC>
]])

require('plugins')
require('plugin_settings')

-- vim.cmd([[
-- 	標準プラグインの無効化
-- 	let g:did_install_default_menus = 1
-- 	let g:did_install_syntax_menu   = 1
-- 	let g:did_indent_on             = 1
-- 	let g:did_load_filetypes        = 1
-- 	let g:did_load_ftplugin         = 1
-- 	let g:loaded_2html_plugin       = 1
-- 	let g:loaded_gzip               = 1
-- 	let g:loaded_man                = 1
-- 	let g:loaded_matchit            = 1
--
-- 	let g:loaded_matchparen         = 1
-- 	let g:loaded_netrwPlugin        = 1
-- 	let g:loaded_remote_plugins     = 1
-- 	let g:loaded_shada_plugin       = 1
-- 	let g:loaded_spellfile_plugin   = 1
-- 	let g:loaded_tarPlugin          = 1
-- 	let g:loaded_tutor_mode_plugin  = 1
-- 	let g:loaded_zipPlugin          = 1
-- 	let g:skip_loading_mswin        = 1
-- ]])

