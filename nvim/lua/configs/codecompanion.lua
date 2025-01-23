local keymap = vim.api.nvim_set_keymap
local status_ok, codecompanion = pcall(require, "codecompanion")
if not status_ok then
  return
end

keymap("n", "<leader>aa", "<cmd>CodeCompanionChat Toggle<CR>", { noremap = true, silent = true })
keymap("n", "<leader>ax", "<cmd>CodeCompanionChat Add<CR>", { noremap = true, silent = true })

codecompanion.setup({
  opts = {
    language = "Japanese",
    send_code = true,
  },
  strategies = {
    chat = {
      adapter = "copilot",
      roles = {
        llm = "CodeCompanion",
        user = "Me",
      },
      agents = {
        ["full_stack_dev"] = {
          description = "Full Stack Developer - コードの実行・編集・ファイルの修正ができる。",
          system_prompt = "**DO NOT** make any assumptions about the dependencies that a user has installed. If you need to install any dependencies to fulfil the user's request, do so via the Command Runner tool. If the user doesn't specify a path, use their current working directory.",
          tools = {
            "cmd_runner",
            "editor",
            "files",
          },
        },
        tools = {
          ["cmd_runner"] = {
            callback = "strategies.chat.tools.cmd_runner",
            description = "シェルコマンドを実行する。",
            opts = {
              user_approval = true,
            },
          },
          ["editor"] = {
            callback = "strategies.chat.tools.editor",
            description = "LLMからのresponseでbufferを更新する。",
          },
          ["files"] = {
            callback = "strategies.chat.tools.files",
            description = "LLMからのresponseでファイルを更新する。",
            opts = {
              user_approval = true,
            },
          },
          ["rag"] = {
            callback = "strategies.chat.tools.rag",
            description = "インターネットからのリアルタイム情報をLLMに追加する。",
            opts = {
              hide_output = true,
            },
          },
        },
      },
      variables = {
        ["buffer"] = {
          callback = "strategies.chat.variables.buffer",
          description = "現在のbufferをLLMと共有する。",
          opts = {
            contains_code = true,
            has_params = true,
          },
        },
        ["lsp"] = {
          callback = "strategies.chat.variables.lsp",
          description = "現在のbufferのLSP情報とコードを共有する。",
          opts = {
            contains_code = true,
          },
        },
        ["viewport"] = {
          callback = "strategies.chat.variables.viewport",
          description = "Neovimに表示されるコードをLLMと共有する。",
          opts = {
            contains_code = true,
          },
        },
      },
      slash_commands = {
        ["buffer"] = {
          callback = "strategies.chat.slash_commands.buffer",
          description = "開いているbufferを選択してchatコンテキストに渡す。",
          opts = {
            contains_code = true,
            provider = "telescope",
          },
        },
        ["fetch"] = {
          callback = "strategies.chat.slash_commands.fetch",
          description = "URLのコンテンツをchatコンテキストに渡す。",
          opts = {
            adapter = "jina",
          },
        },
        ["file"] = {
          callback = "strategies.chat.slash_commands.file",
          description = "プロジェクトのファイルを選択してchatコンテキストに渡す。",
          opts = {
            contains_code = true,
            max_lines = 1000,
            provider = "telscope",
          },
        },
        ["help"] = {
          callback = "strategies.chat.slash_commands.help",
          description = "Neovimのヘルプタグから選択してchatコンテキストに渡す。",
          opts = {
            contains_code = false,
            max_lines = 128,
            provider = "telescope",
          },
        },
        ["now"] = {
          callback = "strategies.chat.slash_commands.now",
          description = "現在時刻",
          opts = {
            contains_code = false,
          },
        },
        ["symbols"] = {
          callback = "strategies.chat.slash_commands.symbols",
          description = "選択したファイルにシンボルを追加する。",
          opts = {
            contains_code = true,
            provider = "telescope",
          },
        },
        ["terminal"] = {
          callback = "strategies.chat.slash_commands.terminal",
          description = "ターミナル出力を挿入する。",
          opts = {
            contains_code = false,
          },
        },
        -- TODO: commitのスラッシュコマンドをカスタマイズしたい
      },
      keymaps = {
        send = {
          modes = { n = { "<CR>", "<C-s>" }, i = "<C-s>" },
        },
        close = {
          modes = { n = "<C-c>", i = "<C-c>" },
        },
      },
    },
    inline = {
      adapter = "copilot",
    },
  },
  display = {
    action_palette = {
      width = 95,
      height = 10,
      prompt = "Prompt ",
      provider = "telescope",
      opts = {
        show_default_actions = true,
        show_default_prompt_library = true,
      },
    },
    chat = {
      window = {
        layout = "vertical",
        position = "right",
        height = 1,
        width = 0.3,
      },
      diff = {
        enabled = true,
        close_chat_at = 240,
        layout = "vertical",
        opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        provider = "default",
      },
      intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
      show_header_separator = false,
      separator = "─",
      show_references = true,
      show_settings = false,
      show_token_count = true,
      start_in_insert_mode = false,
    },
    inline = {
      layout = "vertical",
    },
  },
})
