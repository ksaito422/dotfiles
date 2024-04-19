local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>gf', ':DiffviewFileHistory %<CR>', { noremap = true, silent = true })
