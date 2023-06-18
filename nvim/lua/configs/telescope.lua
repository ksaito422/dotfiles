local keymap = vim.api.nvim_set_keymap
local status_ok, telescope = pcall(require, 'telescope.builtin')
if not status_ok then
    return
end

-- file picker
keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
keymap('n', '<leader>fg', ':Telescope git_files<CR>', { noremap = true, silent = true })
keymap('n', '<leader>fl', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- vim picker
keymap('n', '<leader>vb', ':Telescope buffers<CR>', { noremap = true, silent = true })
keymap('n', '<leader>vr', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
keymap('n', '<leader>vc', ':Telescope commands<CR>', { noremap = true, silent = true })
keymap('n', '<leader>vt', ':Telescope help_tags<CR>', { noremap = true, silent = true })
keymap('n', '<leader>vh', ':Telescope command_history<CR>', { noremap = true, silent = true })
keymap('n', '<leader>vs', ':Telescope search_history<CR>', { noremap = true, silent = true })

-- Neovim LSP picker
-- keymap('n', '<leader>lr', ':Telescope lsp_references<CR>', { noremap = true, silent = true })
keymap('n', '<leader>ld', ':Telescope diagnostics<CR>', { noremap = true, silent = true })
