local status_ok, diffview = pcall(require, 'diffview')
if not status_ok then
	return
end

local keymap = vim.api.nvim_set_keymap

diffview.setup({})

keymap('n', '<leader>gd', ':DiffviewOpen<CR>', { noremap = true, silent = true })
keymap('n', '<leader>gc', ':DiffviewClose<CR>', { noremap = true, silent = true })
