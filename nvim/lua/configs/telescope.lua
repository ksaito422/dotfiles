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
      horizontal = {
        preview_width = 0.5,
      },
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
  },
})

telescope.load_extension("live_grep_args")
