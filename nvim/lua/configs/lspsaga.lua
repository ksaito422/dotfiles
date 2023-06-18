local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

local keymap = vim.keymap.set

saga.setup({})

-- NOTE: lsp configにもlsp関連のコマンドあり
keymap('n', 'K', '<cmd>Lspsaga hover_doc ++quiet<CR>', { noremap = true, silent = true })
keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
keymap('n', '<leader>e', '<cmd>Lspsaga show_line_diagnostics<CR>', { noremap = true, silent = true })
keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { noremap = true, silent = true })
keymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = true })
keymap('n', 'rn', '<cmd>Lspsaga rename<CR>', { noremap = true, silent = true })
keymap('n', 'ga', '<cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
keymap('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>sw', '<cmd>Lspsaga show_workspace_diagnostics<CR>', { noremap = true, silent = true })

