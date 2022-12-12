vim.api.nvim_set_keymap('n', '<C-b>', ':Fern . -reveal=% -drawer -toggle -width=40<CR>', { noremap = true, silent = true})

vim.cmd([[
	let g:fern#default_hidden = 1
	let g:fern_disable_startup_warnings = 1

	" filerのアイコン設定"
	let g:fern#renderer = 'nerdfont'
]])
