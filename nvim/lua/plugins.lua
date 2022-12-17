local status = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end

-- this file can be loaded by calling `lua require('plugins')` from your init.vim

-- only required if you have packer configured as `opt`
vim.cmd.packadd 'packer.nvim'

require('packer').startup(function(use)

	-- プラグイン
	use 'wbthomason/packer.nvim'

	-- ------------------------------------------
	-- 視認性Up plugins
	-- ------------------------------------------

	-- syntax highlight enable
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- color schema
	use 'EdenEast/nightfox.nvim'

	-- status line
	use 'itchyny/lightline.vim'

	-- font & file icon
	use 'lambdalisue/nerdfont.vim'

	-- file treeにgitの差分を表示する
	use 'lambdalisue/fern-git-status.vim'

	-- font & file icon
	use 'lambdalisue/nerdfont.vim'

	-- filerのアイコン表示
	use 'lambdalisue/fern-renderer-nerdfont.vim'

	-- filerのiconをカラー表示
	use 'lambdalisue/glyph-palette.vim'

	-- 対応する()のカラーリング
	use 'luochen1990/rainbow'

	-- bufferlineにアイコンを表示
	use 'kyazdani42/nvim-web-devicons'

	-- buffer lineにbufferを表示
	use 'romgrk/barbar.nvim'

	-- indentlineの表示
	use 'lukas-reineke/indent-blankline.nvim'

	--	 TOML形式のsyntax highlight enable
	use 'cespare/vim-toml'

	-- ------------------------------------------
	-- 開発体験Up plugins
	-- ------------------------------------------

	-- Gitの変更表示
	use 'airblade/vim-gitgutter'

	-- ConflitMarger
	use 'rhysd/conflict-marker.vim'

	-- lazygit(git ui)
	use 'kdheepak/lazygit.nvim'

	-- git blame(vscodeのGitlensのようなもの)
	use 'APZelos/blamer.nvim'

	-- コメントアウト用 nvim-ts-context-commentstringと組み合わせる
	use 'numToStr/Comment.nvim'

	-- jsx,tsxコメントアウト
	use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- ------------------------------------------
	-- 操作性Up plugins
	-- ------------------------------------------

	-- filer
	use 'lambdalisue/fern.vim'

	-- file preview
	use 'yuki-yano/fern-preview.vim'

	-- terminal
	use 'Shougo/deol.nvim'

	-- yank範囲のhighlight
	use 'machakann/vim-highlightedyank'

	-- windowのリサイズ
	use 'simeji/winresizer'

	-- / or ? 検索のジャンプ拡張
	use 'hrsh7th/vim-searchx'

	-- ------------------------------------------
	-- Formater&Linter Plugins
	-- ------------------------------------------

	-- spell check
	use 'kamykn/spelunker.vim'

	-- spell check拡張のneovim対応
	use 'kamykn/popup-menu.nvim'

	-- 対応する括弧などを補完
	use 'cohama/lexima.vim'

	-- js&ts&jsx&tsx formatter&linter
	use 'dense-analysis/ale'

	-- ------------------------------------------
	-- Language protocol server plugins
	-- ------------------------------------------

	-- Neovim Builtin LSPが提供する構文を引っ張ってくる
	use 'Shougo/ddc-nvim-lsp'

	-- 入力補完
	use {
		'Shougo/ddc.vim',
		requires = { 'vim-denops/denops.vim' }
	}

	-- 補完候補
	use 'Shougo/pum.vim'

	-- 補完候補UI
	use 'Shougo/ddc-ui-native'

	-- 補完(ddc-matcher_head, ddc-sorter_rank, ddc-converter_remove_overlapとほぼ同じ機能)
	use 'tani/ddc-fuzzy'

	-- 行の周辺の単語を候補として抽出
	use 'Shougo/ddc-source-around'

	-- snipet
	use {
		'hrsh7th/vim-vsnip',
		requires = {
			'hrsh7th/vsnip-integ',
			'rafamadriz/friendly-snippets'
		}
	}

	-- snipet
	use 'hrsh7th/vim-vsnip-integ'

	-- snipet
	use 'rafamadriz/friendly-snippets'

	-- Neovim LSP config
	use 'neovim/nvim-lspconfig'

	-- LSP, DAP, Linter, Formatter
	use { 'williamboman/mason.nvim', requires = { 'neovim/nvim-lspconfig' } }

	-- LSP, DAP, Linter, Formatter manager
	use { 'williamboman/mason-lspconfig.nvim', requires = { 'neovim/nvim-lspconfig' } }

	-- ------------------------------------------
	-- Debug adapter protocol plugins
	-- ------------------------------------------

	-- debug adapter protocol
	use 'mfussenegger/nvim-dap'

	-- debug ui
	use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }

	-- debug for golang
	use { 'leoluz/nvim-dap-go', opt = true, ft = { 'go' } }

	-- ------------------------------------------
	-- 翻訳 plugins
	-- ------------------------------------------

	-- :help language Japanese
	use 'vim-jp/vimdoc-ja'

	-- 翻訳ツール
	use 'skanehira/translate.vim'

	-- ------------------------------------------
	-- other plugins(依存関係のためなど)
	-- ------------------------------------------

	-- cheatsheet
	use 'reireias/vim-cheatsheet'

	-- Denoでプラグインを作るエコシステム
	use 'vim-denops/denops.vim'

end)
