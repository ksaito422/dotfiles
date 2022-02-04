"基本設定
"edita setting
set encoding=utf-8 "文字コードをUTF-8に設定
set number "行番号を表示
set virtualedit=onemore "行末の1文字先までカーソルを移動できるように
set autoindent "改行時に自動インデント
set splitbelow "画面を水平分割時に下に表示
set splitright "画面を垂直分割時に右に表示
set wildmenu "コマンドモードの補完
set scrolloff=10 "画面端でのスクロール位置指定

"見た目系
set cursorline "現在の行を強調表示
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
"set cursorcolumn
set hls "検索した文字列をハイライトする

"tab setting
set smartindent
set tabstop=4 "tab半角スペースの数
set expandtab "tabを複数のspaceに置換
set shiftwidth=4 "tabの幅

"floating windowを半透明にする
set termguicolors
set pumblend=10
set winblend=10

" タブページを常に表示
set showtabline=2

"マウス操作
set mouse=a
set clipboard=unnamed

"spell check
set nospell "spelunker.vimの機能を使うためoff

"Emacs Move
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <Esc>D
imap <C-u> <Esc>dd

"バッファ操作
nnoremap <silent> <C-[> :bprev <CR>
nnoremap <silent> <c-]> :bnext <CR>

let mapleader = "\<SPACE>"

"ターミナルモード
tnoremap <Esc> <C-\><C-n>
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
autocmd TermOpen * startinsert

"neovim && dein.vimの設定
"プラグインをdein.toml, dein_lazy.tomlから読み込む
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
	call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
	call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
	call dein#save_state()
endif
filetype plugin indent on
syntax enable

if dein#check_install()
 call dein#install()
endif

"ノーマルモード切り替え時に日本語入力をoffにする
function! s:disableIme()
    if has('mac')
        call jobstart(['osascript', '-e', 'tell application "System Events" to key code {102}'], {'in_io': 'null', 'out_io': 'null', 'err_io': 'null'})
    endif
endfunction

" 日本語入力から半角入力のノーマルモードへ抜ける。ｊｋ
inoremap <silent> jk <C-o>:call <SID>disableIme()<CR><ESC>
