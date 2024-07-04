local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

local keymap = vim.api.nvim_set_keymap

-- Move to previous/next
-- keymap('n', '<A-,>', ':BufferPrevious<CR>', { noremap = true, silent = true })
-- keymap('n', '<A-.>', ':BufferNext<CR>', { noremap = true, silent = true })
-- Re-order to previous/next
keymap("n", "<A-<>", ":BufferMovePrevious<CR>", { noremap = true, silent = true })
keymap("n", "<A->>", ":BufferMoveNext<CR>", { noremap = true, silent = true })
-- Goto buffer in position...
keymap("n", "<A-1>", ":BufferGoto 1<CR>", { noremap = true, silent = true })
keymap("n", "<A-2>", ":BufferGoto 2<CR>", { noremap = true, silent = true })
keymap("n", "<A-3>", ":BufferGoto 3<CR>", { noremap = true, silent = true })
keymap("n", "<A-4>", ":BufferGoto 4<CR>", { noremap = true, silent = true })
keymap("n", "<A-5>", ":BufferGoto 5<CR>", { noremap = true, silent = true })
keymap("n", "<A-6>", ":BufferGoto 6<CR>", { noremap = true, silent = true })
keymap("n", "<A-7>", ":BufferGoto 7<CR>", { noremap = true, silent = true })
keymap("n", "<A-8>", ":BufferGoto 8<CR>", { noremap = true, silent = true })
keymap("n", "<A-9>", ":BufferGoto 9<CR>", { noremap = true, silent = true })
keymap("n", "<A-p>", ":BufferPin<CR>", { noremap = true, silent = true })
keymap("n", "<A-c>", ":BufferClose<CR>", { noremap = true, silent = true })
-- Wipeout buffer
--                          :BufferWipeout<CR>
-- Close commands
--                          :BufferCloseAllButCurrent<CR>
--                          :BufferCloseAllButPinned<CR>
--                          :BufferCloseAllButCurrentOrPinned<CR>
--                          :BufferCloseBuffersLeft<CR>
--                          :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
keymap("n", "<C-s>", ":BufferPick<CR>", { noremap = true, silent = true })
-- Sort automatically by...
keymap("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>", { noremap = true, silent = true })
keymap("n", "<Space>bd", ":BufferOrderByDirectory<CR>", { noremap = true, silent = true })
keymap("n", "<Space>bl", ":BufferOrderByLanguage<CR>", { noremap = true, silent = true })
keymap("n", "<Space>bw", ":BufferOrderByWindowNumber<CR>", { noremap = true, silent = true })
-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

bufferline.setup({
  icons = { filetype = { enabled = true } },
})
