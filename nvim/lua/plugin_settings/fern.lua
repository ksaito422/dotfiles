local keymap = vim.api.nvim_set_keymap

-- fern.vim
keymap('n', '<C-b>', ':Fern . -reveal=% -drawer -toggle -width=40<CR>', { noremap = true, silent = true })

-- fern-renderer-nerdfont.vim
vim.cmd([[
	let g:fern#default_hidden = 1
	let g:fern_disable_startup_warnings = 1

	" filerのアイコン設定"
	let g:fern#renderer = 'nerdfont'
]])

-- fern-preview.vim
vim.cmd([[
	function! s:fern_settings() abort
  		nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  		nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  		nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  		nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
	endfunction

	augroup fern-settings
  		autocmd!
  		autocmd FileType fern call s:fern_settings()
	augroup END
]])
