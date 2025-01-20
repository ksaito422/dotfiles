vim.cmd([[
	autocmd ColorScheme * highlight lineNr ctermbg=none guibg=none
	autocmd ColorScheme * highlight SignColumn ctermbg=none guibg=none
	autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
	autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
	autocmd ColorScheme * highlight Folded ctermbg=none guibg=none
  autocmd ColorScheme * highlight TelescopePromptNormal guifg=#F1F1F1 guibg=#434343
  autocmd ColorScheme * highlight TelescopePromptBorder guifg=#434343 guibg=#434343
  autocmd ColorScheme * highlight TelescopePromptTitle guifg=#B7B8B6 guibg=#336B87
  autocmd ColorScheme * highlight TelescopePreviewNormal guifg=#F1F1F1 guibg=#393939
  autocmd ColorScheme * highlight TelescopePreviewBorder guifg=#393939 guibg=#393939
  autocmd ColorScheme * highlight TelescopePreviewTitle guifg=#B7B8B6 guibg=#2C7873
  autocmd ColorScheme * highlight TelescopeResultsNormal guifg=#F1F1F1 guibg=#323232
  autocmd ColorScheme * highlight TelescopeResultsBorder guifg=#323232 guibg=#323232
  autocmd ColorScheme * highlight TelescopeResultsTitle guifg=#B7B8B6 guibg=#2C7873
]])

if not vim.g.vscode then
  -- vim.cmd([[colorscheme nightfox]])
  -- vim.cmd([[colorscheme tokyonight]])
  -- vim.cmd([[colorscheme tokyonight-moon]])
  -- vim.cmd([[colorscheme tokyonight-storm]])
  -- vim.cmd([[colorscheme gruber-darker]])
  vim.cmd([[colorscheme kanagawa]])
  -- vim.cmd([[colorscheme kanagawa-wave]])
  -- vim.cmd([[colorscheme kanagawa-dragon]])
  -- vim.cmd([[colorscheme flow]])
end
