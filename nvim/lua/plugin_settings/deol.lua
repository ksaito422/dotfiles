local keymap = vim.api.nvim_set_keymap

keymap('n', '<C-t>', ':Deol -split=floting -winwidth=200 -winheight=200<CR>', { noremap = true, silent = true })
keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
