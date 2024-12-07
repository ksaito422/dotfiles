vim.cmd([[
	autocmd ColorScheme * highlight lineNr ctermbg=none guibg=none
	autocmd ColorScheme * highlight SignColumn ctermbg=none guibg=none
	autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
	autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
	autocmd ColorScheme * highlight Folded ctermbg=none guibg=none
	autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none
]])

if not vim.g.vscode then
  -- vim.cmd([[colorscheme nightfox]])
  -- vim.cmd([[colorscheme tokyonight]])
  vim.cmd([[colorscheme tokyonight-moon]])
  -- vim.cmd([[colorscheme tokyonight-storm]])
  -- vim.cmd([[colorscheme gruber-darker]])
  -- vim.cmd([[colorscheme kanagawa]])
  -- vim.cmd([[colorscheme kanagawa-wave]])
  -- vim.cmd([[colorscheme kanagawa-dragon]])
  -- vim.cmd([[colorscheme flow]])
end
