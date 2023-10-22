local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>gd', ':DiffviewOpen<CR>', { noremap = true, silent = true })
keymap('n', '<leader>gc', ':DiffviewClose<CR>', { noremap = true, silent = true })
