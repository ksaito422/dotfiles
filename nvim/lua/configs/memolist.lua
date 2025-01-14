vim.g.memolist_path="~/.memolist"
vim.g.memolist_memo_suffix="md"
vim.api.nvim_set_keymap("n", "<Leader>mn", ":MemoNew<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>ml", ":MemoList<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>mg", ":MemoGrep<CR>", {noremap = true, silent = true})
