local keymap = vim.api.nvim_set_keymap
local status_ok, telescope = pcall(require, 'telescope.builtin')
if not status_ok then
    return
end

keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
keymap('n', '<leader>fr', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })
