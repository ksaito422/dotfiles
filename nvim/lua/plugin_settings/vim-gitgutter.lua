vim.api.gitgutter_map_keys = 0

vim.api.nvim_set_keymap('n', 'g]', ':GitGutterNextHunk<CR>', {})
vim.api.nvim_set_keymap('n', 'g[', ':GitGutterNextHunkHunk<CR>', {})
vim.api.nvim_set_keymap('n', 'gh', ':GitGutterLineHighlightsToggle<CR>', {})
vim.api.nvim_set_keymap('n', 'gp', ':GitGutterPreviewHunk<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>ga', ':GitGutterStageHunk<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>gu', ':GitGutterRevertHunk<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>gv', ':GitGutterPreviewHunk<CR>', {})

vim.cmd 'highlight GitGutterAdd guifg = lightgreen'
vim.cmd 'highlight GitGutterChange guifg = yelllw'
vim.cmd 'highlight GitGutterDelete guifg = red'

vim.cmd 'set updatetime=250'

