-- NOTE: null-lsでrubocopがbundle exec rubocopを実行しないため
-- rubocopでは、ale.vimを採用した
vim.cmd([[
    let g:ale_fixers = {
    \    'ruby': ['rubocop'],
    \}
    let g:ale_fix_on_save = 1
]])
