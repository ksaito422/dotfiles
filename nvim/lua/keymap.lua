-- -----------------------------------
-- Neovim standard Keymap settings
-- -----------------------------------

local keymap = vim.api.nvim_set_keymap

-- Emacs move
keymap("i", "<C-p>", "<Up>", {})
keymap("i", "<C-n>", "<Down>", {})
keymap("i", "<C-b>", "<Left>", {})
keymap("i", "<C-f>", "<Right>", {})
keymap("i", "<C-a>", "<Home>", {})
keymap("i", "<C-e>", "<End>", {})
keymap("i", "<C-d>", "<Del>", {})
keymap("i", "<C-h>", "<BS>", {})
keymap("i", "<C-k>", "<Esc>D", {})
keymap("i", "<C-u>", "<Esc>dd", {})

-- terminal move
keymap("t", "<C-p>", "<Up>", { noremap = true })
keymap("t", "<C-n>", "<Down>", { noremap = true })
keymap("t", "<C-b>", "<Left>", { noremap = true })
keymap("t", "<C-f>", "<Right>", { noremap = true })
keymap("t", "<C-d>", "<Del>", { noremap = true })
keymap("t", "<C-h>", "<BS>", { noremap = true })

-- Buffer operation
keymap("n", "<C-[>", ":bprev<CR>", { noremap = true, silent = true })
keymap("n", "<C-]>", ":bnext<CR>", { noremap = true, silent = true })

keymap("n", "<C-c>", ":let @* = expand('%:p')<CR>", { noremap = true })

-- Assign leader key to space key
vim.g.mapleader = " "

-- ノーマルモードに切り替える。[jk]
keymap("i", "jk", "<ESC>", { noremap = true, silent = true })

