local keymap = vim.api.nvim_set_keymap

vim.cmd([[
	" チートシートのパス
	let g:cheatsheet#cheat_file = '~/.config/nvim/cheatsheet.md'
	" 編集時に開くチートシートのパス
	command! EditCheat :edit ~/.config/nvim/cheatsheet.md

	" フローティングウインドウのサイズ
	let g:cheatsheet#float_window = 1
	let g:cheatsheet#float_window_width_ratio = 0.8
	let g:cheatsheet#float_window_height_ratio = 0.7

]])

keymap('n', '<Leader>?', '<Cmd>Cheat<CR>', { noremap = true })
keymap('n', '<Leader>ec', '<Cmd>EditCheat<CR>', { noremap = true })
