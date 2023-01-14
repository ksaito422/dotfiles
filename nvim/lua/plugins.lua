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
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- color schema
	use 'EdenEast/nightfox.nvim'

	-- status line
	use 'itchyny/lightline.vim'

	-- font & file icon
	use 'lambdalisue/nerdfont.vim'

	-- 対応する()のカラーリング
	use 'luochen1990/rainbow'

	-- buffer lineにbufferを表示
	use {
		'romgrk/barbar.nvim',
		requires = {
			-- bufferlineにアイコンを表示
			'kyazdani42/nvim-web-devicons'
		}
	}

	-- indentlineの表示
	use 'lukas-reineke/indent-blankline.nvim'

	--	 TOML形式のsyntax highlight enable
	use { 'cespare/vim-toml', opt = true, ft = { 'toml' } }

	-- カーソル下の単語を自動的にハイライト
	use 'RRethy/vim-illuminate'

	-- ------------------------------------------
	-- 開発体験Up plugins
	-- ------------------------------------------

	-- Gitの変更表示
	use 'lewis6991/gitsigns.nvim'

	-- ConflitMarger
	use 'rhysd/conflict-marker.vim'

	-- lazygit(git ui)
	use 'kdheepak/lazygit.nvim'

	-- コメントアウト用 nvim-ts-context-commentstringと組み合わせる
	use 'numToStr/Comment.nvim'

	-- jsx,tsxコメントアウト
	use {
		'JoosepAlviste/nvim-ts-context-commentstring',
		opt = true,
		ft = { "javascriptreact, typescriptreact" }
	}

	-- TODO/HACK/BUGなどをhighlightする
	use {
		'folke/todo-comments.nvim',
		requires = "nvim-lua/plenary.nvim",
	}

	-- ------------------------------------------
	-- 操作性Up plugins
	-- ------------------------------------------

	-- filer
	use {
		'lambdalisue/fern.vim',
		requires = {
			-- file preview
			'yuki-yano/fern-preview.vim',
			-- filerのアイコン表示
			'lambdalisue/fern-renderer-nerdfont.vim',
			-- file treeにgitの差分を表示する
			'lambdalisue/fern-git-status.vim',
			-- filerのiconをカラー表示
			'lambdalisue/glyph-palette.vim',
		}
	}

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

	-- ------------------------------------------
	-- Language protocol server plugins
	-- ------------------------------------------

	-- Neovim Builtin LSPが提供する構文を引っ張ってくる
	use 'Shougo/ddc-nvim-lsp'

	-- 入力補完
	use {
		'Shougo/ddc.vim',
		requires = {
			-- 補完候補
			'Shougo/pum.vim',
			-- 補完候補UI
			'Shougo/ddc-ui-native',
			-- 補完(ddc-matcher_head, ddc-sorter_rank, ddc-converter_remove_overlapとほぼ同じ機能)
			'tani/ddc-fuzzy',
			-- 行の周辺の単語を候補として抽出
			'Shougo/ddc-source-around'
		}
	}

	-- snipet
	use {
		'hrsh7th/vim-vsnip',
		requires = {
			-- snipet
			'hrsh7th/vim-vsnip-integ',
			-- snipet
			'rafamadriz/friendly-snippets'
		}
	}

	-- Neovim LSP config
	use {
		'neovim/nvim-lspconfig',
		requires = {
			-- LSP, DAP, Linter, Formatter
			'williamboman/mason.nvim',
			-- LSP, DAP, Linter, Formatter manager
			'williamboman/mason-lspconfig.nvim'
		}
	}

	-- jsx,tsx用のlsp
	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	-- neovim prettier
	use 'MunifTanjim/prettier.nvim'

	-- ------------------------------------------
	-- Debug adapter protocol plugins
	-- ------------------------------------------

	-- debug adapter protocol
	use {
		'mfussenegger/nvim-dap',
		requires = {
			-- debug ui
			'rcarriga/nvim-dap-ui',
			-- debug for golang
			{ 'leoluz/nvim-dap-go', opt = true, ft = { 'go' } }
		}
	}

	-- ------------------------------------------
	-- 翻訳 plugins
	-- ------------------------------------------

	-- :help language Japanese
	use 'vim-jp/vimdoc-ja'

	-- 翻訳ツール
	use {
		'skanehira/translate.vim',
		opt = true,
		cmd = { 'tt' },
	}

	-- ------------------------------------------
	-- other plugins(依存関係のためなど)
	-- ------------------------------------------

	-- 起動画面
	use 'mhinz/vim-startify'

	-- cheatsheet
	use {
		'reireias/vim-cheatsheet',
		opt = true,
		cmd = { 'Cheat', 'EditCheat' }
	}

	-- Denoでプラグインを作るエコシステム
	use {
		'vim-denops/denops.vim',
		requires = {
			'Shougo/ddc.vim'
		}
	}

end)
