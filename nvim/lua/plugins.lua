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

require("lazy").setup({
  -- syntax highlight enable
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("configs.treesitter")
    end,
    build = ":TSUpdate",
    event = "VimEnter",
  },

  -- color schema
  {
    -- "folke/tokyonight.nvim",
    -- "EdenEast/nightfox.nvim",
    -- 'blazkowolf/gruber-darker.nvim',
    "rebelot/kanagawa.nvim",
    -- "0xstepit/flow.nvim",
    config = function()
      require("configs.colorscheme")
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require("configs.which-key")
    end,
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.lualine")
    end,
    event = "VimEnter",
  },

  -- indent lineの表示
  {
    "shellRaining/hlchunk.nvim",
    config = function()
      require("configs.hlchunk")
    end,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

  -- カーソル下の単語を自動的にハイライト
  {
    "RRethy/vim-illuminate",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

  -- markdown preview
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },

  -- color codeの色を表示する
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

  -- gh cli
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("configs.octo")
    end,
  },

  -- Gitの変更表示
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("configs.gitsigns")
    end,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

  -- ConflictMarker
  {
    "rhysd/conflict-marker.vim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

  -- lazygit(git ui)
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
  },

  -- jsx,tsxコメントアウト
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    config = function()
      require("ts-comments").setup()
    end,
  },

  -- TODO/HACK/BUGなどをhighlightする
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("configs.todo-comments")
    end,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

  -- ファジーファインダー
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("configs.telescope")
    end,
    -- telescopeのhighlightの適用がズレて反映されないときがあるのでoffにする
    -- event = {
    --   "VimEnter",
    -- },
  },

  -- HTMLタグのauto close & auto rename
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("configs.nvim-ts-autotag")
    end,
    ft = { "html", "jsx", "tsx", "javascriptreact", "typescriptreact" },
  },

  -- yank範囲のhighlight
  {
    "machakann/vim-highlightedyank",
    keys = { "y", mode = "n" },
  },

  -- windowのリサイズ
  {
    "simeji/winresizer",
    keys = { "<C-e>", mode = "n" },
  },

  -- spell check
  {
    "kamykn/spelunker.vim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

  -- 対応する括弧などを補完
  {
    "cohama/lexima.vim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

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

  -- 入力補完(completion, documentation, command line)
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "dmitmel/cmp-cmdline-history",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("configs.nvim-cmp")
    end,
    event = "VimEnter",
  },

  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
    dependencies = {
      "hrsh7th/nvim-cmp",
      "zbirenbaum/copilot.lua",
    },
  },

  -- Neovim LSP config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.nvim-lspconfig")
    end,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

  -- LSPの操作を楽にする
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.trouble")
    end,
  },

  -- winbarにパンくずリストを表示
  {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  },

  -- LSP, DAP, Linter, Formatter manager
  {
    "williamboman/mason.nvim",
    config = function()
      require("configs.mason")
    end,
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",
    },
  },

  -- LSP, DAP, Linter, Formatter
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("configs.mason-lspconfig")
    end,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

  -- lspのセットアップ状況の可視化と通知を見やすくする
  {
    "j-hui/fidget.nvim",
    config = function()
      require("configs.fidget")
    end,
  },

  -- github copilot
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("configs.copilot")
    end,
  },

  -- copilot chat
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("configs.codecompanion")
    end,
  },

  -- markdown preview
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown", "codecompanion" },
    opts = {
      filetypes = { "markdown", "codecompanion" },
      buf_ignore = {},
    },
  },

  -- memo
  {
    "glidenote/memolist.vim",
    config = function()
      require("configs.memolist")
    end,
  },

  -- LSP以外のformat,linter(prettier, rubocopなど)を動かすプラグイン
  -- {
  --   "nvimtools/none-ls.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("configs.null-ls")
  --   end,
  -- },

  -- :help language Japanese
  {
    "vim-jp/vimdoc-ja",
    keys = { { "h", mode = "c" } },
  },
  -- ------------------------------------------
  -- other plugins(依存関係のためなど)
  -- ------------------------------------------

  -- 起動画面
  {
    "goolord/alpha-nvim",
    config = function()
      require("configs.alpha")
    end,
    event = "VimEnter",
  },

  -- Denoでプラグインを作るエコシステム
  {
    "vim-denops/denops.vim",
    dependencies = {
      -- 'Shougo/ddc.vim',
      -- 翻訳ツール
      { "skanehira/denops-translate.vim" },
    },
    event = { "BufReadPre" },
    cmd = { "Translate" },
  },

  -- plugin docを楽に生成するため
  {
    "LeafCage/vimhelpgenerator",
    cmd = {
      "VimHelpGenerator",
      "HelpIntoMarkdown",
    },
  },
  -- dependencies plugins
  "nvim-tree/nvim-web-devicons",
  "nvim-lua/plenary.nvim",

  -- ------------------------------------------
  -- 自作プラグイン
  -- ------------------------------------------

  {
    "ksaito422/neosess",
    config = function()
      require("neosess").setup({})
    end,
    cmd = {
      "NeosessList",
      "NeosessSave",
    },
  },

  -- 該当ソースをリモートリポジトリで開く
  {
    "ksaito422/remote-line.nvim",
    -- dir = "~/work/project/dev/nvim-plug/remote-line.nvim",
    config = function()
      require("remote-line").setup({
        vim.api.nvim_set_keymap("n", "<leader>gh", "<Cmd>RemoteLine<CR>", { noremap = true, silent = true }),
      })
    end,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },
})

-- -----------------------------------
-- Loading neovim plugin settings
-- -----------------------------------
require("configs/conflict-marker")
-- require('configs/ddc')
-- require('configs/pum')
require("configs/glyph-palette")
require("configs/translate")
require("configs/vim-highlightedyank")
-- require('configs/null-ls')
require("configs/vim-illuminate")
require("configs/lazygit")
