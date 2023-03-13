local keymap = vim.api.nvim_set_keymap

local status_ok, nvim_lsp = pcall(require, 'lspconfig')
if not status_ok then
	return
end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
	-- formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
			desc = "[lsp] format on save",
		})
	end
end

keymap('n', '<Leader>z', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })

nvim_lsp.gopls.setup { on_attach = on_attach }
nvim_lsp.solargraph.setup { on_attach = on_attach }
nvim_lsp.clangd.setup { on_attach = on_attach }
nvim_lsp.lua_ls.setup {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
nvim_lsp.tflint.setup { on_attach = on_attach }
nvim_lsp.terraform_lsp.setup { on_attach = on_attach }
nvim_lsp.tsserver.setup {
	on_attach = on_attach,
	filetypes = {
		'javascript',
		'typescript',
		'javascriptreact',
		'typescriptreact',
		'javascript.jsx',
		'typescript.tsx',
	},
	cmd = { 'typescript-language-server', '--stdio' },
}
