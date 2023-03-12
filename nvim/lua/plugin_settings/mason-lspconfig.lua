local status_ok, mason_lsp = pcall(require, 'mason-lspconfig')
if not status_ok then
	return
end

mason_lsp.setup()
mason_lsp.setup_handlers({ function(server_name)
	local on_attach = function(client, bufnr)
		local set = vim.keymap.set
		set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
		set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
		set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
		set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
		set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
		set('n', 'gx', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
		set('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
		set('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
		set('n', 'J', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	end
	require('lspconfig')[server_name].setup {
		on_attach = on_attach
	}
end
})
