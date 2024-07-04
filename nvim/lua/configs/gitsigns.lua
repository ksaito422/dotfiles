local keymap = vim.api.nvim_set_keymap
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup({
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = " @ <abbrev_sha>, <author>, <author_time:%Y-%m-%d> - <summary>",
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
})

keymap("n", "<leader>gb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', {
  noremap = true,
  silent = true,
})
keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", {
  noremap = true,
  silent = true,
})
keymap("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", {
  noremap = true,
  silent = true,
})
keymap("n", "<leader>g]", "<cmd>Gitsigns next_hunk<CR>", {
  noremap = true,
  silent = true,
})
keymap("n", "<leader>g[", "<cmd>Gitsigns prev_hunk<CR>", {
  noremap = true,
  silent = true,
})
