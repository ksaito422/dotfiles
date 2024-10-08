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
    sorting_strategy = "ascending",
    winblend = 4,
    layout_strategy = "vertical",
    layout_config = {
      height = 0.8,
      width = 0.8,
    },
    file_ignore_patterns = { "^.git/", "^node_modules/" },
    mappings = {
      n = {
        ["d"] = require("telescope.actions").delete_buffer,
      },
    },
  },
})

telescope.load_extension("live_grep_args")
