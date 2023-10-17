local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- syntax highlight enable
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    -- color schema
    -- use 'EdenEast/nightfox.nvim'
    'folke/tokyonight.nvim',

    -- status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- 対応する()のカラーリング
    'luochen1990/rainbow',

    -- buffer lineにbufferを表示
    {
        'romgrk/barbar.nvim',
        -- bufferlineにアイコンを表示
        dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- indentlineの表示
    'lukas-reineke/indent-blankline.nvim',

    --	 TOML形式のsyntax highlight enable
    {
        'cespare/vim-toml',
        ft = { 'toml' },
    },

    -- カーソル下の単語を自動的にハイライト
    'RRethy/vim-illuminate',

    -- markdown preview
    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
    },

    -- color cordの色を表示する
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },

    -- Gitの変更表示
    'lewis6991/gitsigns.nvim',

    -- ConflitMarger
    'rhysd/conflict-marker.vim',

    -- lazygit(git ui)
    'kdheepak/lazygit.nvim',

    -- git diff
    {
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
    },

    -- コメントアウト用 nvim-ts-context-commentstringと組み合わせる
    'numToStr/Comment.nvim',

    -- jsx,tsxコメントアウト
    'JoosepAlviste/nvim-ts-context-commentstring',

    -- TODO/HACK/BUGなどをhighlightする
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
    },

    -- ファジーファインダー
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = 'nvim-lua/plenary.nvim',
    },

    -- HTMLタグのauto close & auto rename
    'windwp/nvim-ts-autotag',

    -- 該当ソースをリモートリポジトリで開く
    'ruanyl/vim-gh-line',

    -- filer
    {
        'lambdalisue/fern.vim',
        dependencies = {
            'yuki-yano/fern-preview.vim',
            'lambdalisue/nerdfont.vim',
            {
                'lambdalisue/fern-renderer-nerdfont.vim',
                config = function()
                    vim.g['fern#renderer'] = "nerdfont"
                end,
                dependencies = { 'lambdalisue/nerdfont.vim' },
            },
            'lambdalisue/fern-git-status.vim',
            'lambdalisue/glyph-palette.vim',
        },
    },

    -- terminal
    'Shougo/deol.nvim',

    -- yank範囲のhighlight
    'machakann/vim-highlightedyank',

    -- windowのリサイズ
    'simeji/winresizer',

    -- / or ? 検索のジャンプ拡張
    'hrsh7th/vim-searchx',

    -- spell check
    'kamykn/spelunker.vim',

    -- spell check拡張のneovim対応
    'kamykn/popup-menu.nvim',

    -- 対応する括弧などを補完
    'cohama/lexima.vim',

    -- Neovim Builtin LSPが提供する構文を引っ張ってくる
    -- 'Shougo/ddc-nvim-lsp'

    -- 入力補完
    -- {
    --     'Shougo/ddc.vim',
    --     dependencies = {
    --         -- 補完候補
    --         'Shougo/pum.vim',
    --         'Shougo/ddc-ui-pum',
    --         -- 補完(ddc-matcher_head, ddc-sorter_rank, ddc-converter_remove_overlapとほぼ同じ機能)
    --         'tani/ddc-fuzzy',
    --         -- 行の周辺の単語を候補として抽出
    --         'Shougo/ddc-source-around',
    --         -- 補完ソース
    --         'Shougo/ddc-source-nvim-lsp',
    --         -- 関数の引数ヘルプ
    --         'matsui54/denops-signature_help',
    --         -- Show completion documentation
    --         'matsui54/denops-popup-preview.vim',
    --         -- path completion
    --         'tani/ddc-path',
    --     },
    -- },

    -- colorful cursor
    'gen740/SmoothCursor.nvim',

    -- 入力補完(completion, documentation, command line)
    {
        'hrsh7th/cmp-nvim-lsp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'dmitmel/cmp-cmdline-history',
            'hrsh7th/nvim-cmp',
            'onsails/lspkind.nvim',
        },
    },

    -- snipet
    {
        'hrsh7th/vim-vsnip',
        dependencies = {
            -- snipet
            'hrsh7th/vim-vsnip-integ',
            -- snipet
            'rafamadriz/friendly-snippets',
        },
    },

    -- Neovim LSP config
    'neovim/nvim-lspconfig',

    -- LSP uiをカッコよくする
    {
        'nvimdev/lspsaga.nvim',
        branch = 'main',
    },

    -- LSP, DAP, Linter, Formatter manager
    'williamboman/mason.nvim',

    -- LSP, DAP, Linter, Formatter
    'williamboman/mason-lspconfig.nvim',

    -- LSP以外のformat,linter(prettier, rubocopなど)を動かすプラグイン
    -- {
    --     'jose-elias-alvarez/null-ls.nvim',
    --     dependencies = { 'nvim-lua/plenary.nvim' },
    -- },

    -- 'w0rp/ale',

    -- debug adapter protocol
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            -- debug ui
            'rcarriga/nvim-dap-ui',
            -- debug for golang
            { 'leoluz/nvim-dap-go', ft = { 'go' } },
            -- debug for ruby
            'suketa/nvim-dap-ruby',
        },
    },

    -- :help language Japanese
    'vim-jp/vimdoc-ja',

    -- ------------------------------------------
    -- other plugins(依存関係のためなど)
    -- ------------------------------------------

    -- 起動画面
    'goolord/alpha-nvim',

    -- cheatsheet
    {
        'reireias/vim-cheatsheet',
        cmd = { 'Cheat', 'EditCheat' },
    },

    -- 通知やコマンドラインをカッコよくする
    {
        'folke/noice.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
    },

    -- Denoでプラグインを作るエコシステム
    {
        'vim-denops/denops.vim',
        dependencies = {
            -- 'Shougo/ddc.vim',
            -- 翻訳ツール
            'skanehira/denops-translate.vim',
        },
    },

    -- plugin docを楽に生成するため
    'LeafCage/vimhelpgenerator',

    -- dependencies plugins
    'kyazdani42/nvim-web-devicons',
    'lambdalisue/nerdfont.vim',
    'nvim-lua/plenary.nvim',

    -- ------------------------------------------
    -- 自作プラグイン
    -- ------------------------------------------

    {
        'ksaito422/neosess',
        config = function()
            require('neosess').setup({})
        end,
    },
})
