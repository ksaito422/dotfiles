-- setup mapping to call :LazyGit
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

vim.cmd([[
	" transparency of floating window
	let g:lazygit_floating_window_winblend = 0
	" scaling factor for floating window
	let g:lazygit_floating_window_scaling_factor = 0.9
	" customize lazygit popup window corner characters
	let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯']
	" use plenary.nvim to manage floating window if available
	let g:lazygit_floating_window_use_plenary = 0
	" fallback to 0 if neovim-remote is not installed
	let g:lazygit_use_neovim_remote = 1
]])
