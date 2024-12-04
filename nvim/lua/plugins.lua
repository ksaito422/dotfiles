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
  -- use 'EdenEast/nightfox.nvim'
  {
    "folke/tokyonight.nvim",
    -- 'blazkowolf/gruber-darker.nvim',
    -- "rebelot/kanagawa.nvim",
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
    dependencies = {
      -- 'folke/tokyonight.nvim',
      "kyazdani42/nvim-web-devicons",
    },
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
      "nvim-tree/nvim-web-devicons",
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

  -- コメントアウト用 nvim-ts-context-commentstringと組み合わせる
  {
    "numToStr/Comment.nvim",
    config = function()
      require("configs.comment")
    end,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

  -- jsx,tsxコメントアウト
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("configs.nvim-ts-context-commentstring")
    end,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
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
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
      },
    },
    config = function()
      require("configs.telescope")
    end,
    event = {
      "VimEnter",
    },
  },

  -- HTMLタグのauto close & auto rename
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("configs.nvim-ts-autotag")
    end,
    ft = { "html", "jsx", "tsx", "javascriptreact", "typescriptreact" },
  },

  -- filer
  {
    "lambdalisue/fern.vim",
    dependencies = {
      "yuki-yano/fern-preview.vim",
      "lambdalisue/nerdfont.vim",
      {
        "lambdalisue/fern-renderer-nerdfont.vim",
        config = function()
          vim.g["fern#renderer"] = "nerdfont"
        end,
        dependencies = { "lambdalisue/nerdfont.vim" },
      },
      "lambdalisue/fern-git-status.vim",
      "lambdalisue/glyph-palette.vim",
    },
    config = function()
      require("configs.fern")
    end,
    event = "VimEnter",
  },

  -- yank範囲のhighlight
  {
    "machakann/vim-highlightedyank",
    keys = { "y", mode = "n" },
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
      "onsails/lspkind.nvim",
    },
    config = function()
      require("configs.nvim-cmp")
    end,
    event = "VimEnter",
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

  -- LSP uiをカッコよくする
  {
    "nvimdev/lspsaga.nvim",
    branch = "main",
    config = function()
      require("configs.lspsaga")
    end,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
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

  -- github copilot
  {
    "github/copilot.vim",
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

  -- cheatsheet
  {
    "reireias/vim-cheatsheet",
    cmd = {
      "Cheat",
      "EditCheat",
    },
  },

  -- 通知の見た目をよくする
  {
    "rcarriga/nvim-notify",
    event = { "VimEnter" },
    config = function()
      require("configs.nvim-notify")
    end,
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
  "kyazdani42/nvim-web-devicons",
  "lambdalisue/nerdfont.vim",
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
require("configs/cheatsheet")
require("configs/conflict-marker")
-- require('configs/ddc')
-- require('configs/pum')
require("configs/glyph-palette")
require("configs/translate")
require("configs/vim-highlightedyank")
-- require('configs/null-ls')
require("configs/vim-illuminate")
require("configs/lazygit")
