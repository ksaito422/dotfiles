local status, autotag = pcall(require, 'nvim-ts-autotag')
if (not status) then
	return
end

autotag.setup({
	autotag = {
		enable = true,
		filetypes = {
			'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'tsx',
			'jsx', 'rescript',
			'xml',
			'php',
			'markdown',
			'astro',
			'eruby',
			'embedded_template',
		}
	}
})
