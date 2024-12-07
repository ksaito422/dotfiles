local keymap = vim.api.nvim_set_keymap
-- fern.vim
keymap("n", "<C-b>", ":Fern . -reveal=% -drawer -width=30 -toggle -keep<CR>", { noremap = true, silent = true })
vim.g["fern#renderer"] = "nvim-web-devicons"

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
