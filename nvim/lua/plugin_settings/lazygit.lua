local keymap = vim.api.nvim_set_keymap
local g = vim.g

-- setup mapping to call :LazyGit
keymap('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true })

-- transparency of floating window
g.lazygit_floating_window_winblend = 0
-- scaling factor for floating window
g.lazygit_floating_window_scaling_factor = 0.9
-- customize lazygit popup window corner characters
g.lazygit_floating_window_corner_chars = { '╭', '╮', '╰', '╯' }
-- use plenary.nvim to manage floating window if available
g.lazygit_floating_window_use_plenary = 0
-- fallback to 0 if neovim-remote is not installed
g.lazygit_use_neovim_remote = 1
