local cmd = vim.cmd
local keymap = vim.api.nvim_set_keymap

vim.api.gitgutter_map_keys = 0

keymap('n', 'g]', ':GitGutterNextHunk<CR>', {})
keymap('n', 'g[', ':GitGutterNextHunkHunk<CR>', {})
keymap('n', 'gh', ':GitGutterLineHighlightsToggle<CR>', {})
keymap('n', 'gp', ':GitGutterPreviewHunk<CR>', {})
keymap('n', '<Leader>ga', ':GitGutterStageHunk<CR>', {})
keymap('n', '<Leader>gu', ':GitGutterRevertHunk<CR>', {})
keymap('n', '<Leader>gv', ':GitGutterPreviewHunk<CR>', {})

cmd 'highlight GitGutterAdd guifg = lightgreen'
cmd 'highlight GitGutterChange guifg = yelllw'
cmd 'highlight GitGutterDelete guifg = red'

cmd 'set updatetime=250'
