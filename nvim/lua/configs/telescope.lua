local keymap = vim.api.nvim_set_keymap
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

-- file picker
keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
keymap("n", "<leader>fg", ":Telescope git_files hidden=true<CR>", { noremap = true, silent = true })
keymap(
  "n",
  "<leader>fl",
  ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>',
  { noremap = true, silent = true }
)
-- keymap('n', '<leader>fl', ':Telescope live_grep hidden=true<CR>', { noremap = true, silent = true })
keymap("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })

-- vim picker
keymap("n", "<leader>vr", ":Telescope oldfiles<CR>", { noremap = true, silent = true })
keymap("n", "<leader>vc", ":Telescope commands<CR>", { noremap = true, silent = true })
keymap("n", "<leader>vt", ":Telescope help_tags<CR>", { noremap = true, silent = true })
keymap("n", "<leader>vh", ":Telescope command_history<CR>", { noremap = true, silent = true })
keymap("n", "<leader>vs", ":Telescope search_history<CR>", { noremap = true, silent = true })

-- Neovim LSP picker
-- keymap('n', '<leader>lr', ':Telescope lsp_references<CR>', { noremap = true, silent = true })
keymap("n", "<leader>ld", ":Telescope diagnostics<CR>", { noremap = true, silent = true })

-- file_browser
keymap("n", "<C-b>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true, silent = true })

local fb_actions = require("telescope").extensions.file_browser.actions
telescope.setup({
  defaults = {
    wrap_results = false,
    prompt_prefix = " ",
    selection_caret = "❯ ",
    entry_prefix = "  ",
    initial_mode = "normal",
    border = true,
    results_title = "Results",
    prompt_title = "Prompt",
    dynamic_preview_title = true,
    sorting_strategy = "ascending",
    winblend = 10,
    layout_strategy = "horizontal",
    layout_config = {
      height = 0.8,
      width = 0.8,
      prompt_position = "top",
    },
    file_ignore_patterns = { "^.git/", "^node_modules/" },
    mappings = {
      n = {
        ["d"] = require("telescope.actions").delete_buffer,
      },
    },
  },
  pickers = {
    find_files = {
      layout_strategy = "vertical",
      layout_config = {
        height = 0.8,
        width = 0.8,
        prompt_position = "bottom",
      },
    },
    git_files = {
      layout_strategy = "vertical",
      layout_config = {
        height = 0.8,
        width = 0.8,
        prompt_position = "bottom",
      },
    },
    oldfiles = {
      layout_strategy = "vertical",
      layout_config = {
        height = 0.8,
        width = 0.8,
        prompt_position = "bottom",
      },
    },
    buffers = {
      prompt_title = "Find Buffers",
      layout_config = {
        preview_width = 0.5,
      },
    },
    diagnostics = {
      layout_strategy = "vertical",
      layout_config = {
        height = 0.8,
        width = 0.8,
        prompt_position = "bottom",
      },
    },
  },
  extensions = {
    live_grep_args = {
      layout_strategy = "vertical",
      layout_config = {
        height = 0.8,
        width = 0.8,
        prompt_position = "bottom",
      },
    },
    file_browser = {
      prompt_title = "File Explorer",
      -- dir_icon = "",
      hidden = { file_browser = true, folder_browser = true },
      mappings = {
        ["n"] = {
          ["c"] = fb_actions.create,
          ["r"] = fb_actions.rename,
          ["m"] = fb_actions.move,
          ["y"] = fb_actions.copy,
          ["d"] = fb_actions.remove,
          ["o"] = fb_actions.open,
          ["g"] = fb_actions.goto_parent_dir,
          ["e"] = fb_actions.goto_home_dir,
          ["w"] = fb_actions.goto_cwd,
          ["t"] = fb_actions.change_cwd,
          ["f"] = fb_actions.toggle_browser,
          ["h"] = fb_actions.toggle_hidden,
          ["s"] = fb_actions.toggle_all,
        },
      },
      layout_config = {
        preview_width = 0.5,
      },
    },
  },
})

telescope.load_extension("live_grep_args")
telescope.load_extension("file_browser")

vim.cmd([[
  autocmd ColorScheme * highlight TelescopePromptNormal guifg=#F1F1F1 guibg=#434343
  autocmd ColorScheme * highlight TelescopePromptBorder guifg=#434343 guibg=#434343
  autocmd ColorScheme * highlight TelescopePromptTitle guifg=#B7B8B6 guibg=#336B87
  autocmd ColorScheme * highlight TelescopePreviewNormal guifg=#F1F1F1 guibg=#393939
  autocmd ColorScheme * highlight TelescopePreviewBorder guifg=#393939 guibg=#393939
  autocmd ColorScheme * highlight TelescopePreviewTitle guifg=#B7B8B6 guibg=#2C7873
  autocmd ColorScheme * highlight TelescopeResultsNormal guifg=#F1F1F1 guibg=#323232
  autocmd ColorScheme * highlight TelescopeResultsBorder guifg=#323232 guibg=#323232
  autocmd ColorScheme * highlight TelescopeResultsTitle guifg=#B7B8B6 guibg=#2C7873
]])
