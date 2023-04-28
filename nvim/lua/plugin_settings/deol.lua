local keymap = vim.api.nvim_set_keymap

keymap('n', '<C-t>', ':Deol -split=floating -winwidth=200 -winheight=150<CR>', { noremap = true, silent = true })
keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
