vim.cmd([[
	autocmd ColorScheme * highlight lineNr ctermbg=none guibg=none
	autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
	autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
	autocmd ColorScheme * highlight Folded ctermbg=none guibg=none
	autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none
]])

if not vim.g.vscode then
    vim.cmd[[colorscheme tokyonight-night]]
end

