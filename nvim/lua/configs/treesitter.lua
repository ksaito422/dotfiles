local status, nvim_treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

nvim_treesitter_configs.setup {
	highlight = {
		enable = true,
		disable = {}
	},
	indent = {
		enable = true
	},
	ensure_installed = 'all', -- one of "all", "maintained"
	ignore_install = { "haskell", "phpdoc" }
}
