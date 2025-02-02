local keymap = vim.api.nvim_set_keymap
local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  return
end

keymap("n", "<leader>tr", "<Cmd>lua require('neotest').run.run()<CR>", { noremap = true, silent = true })
-- keymap("n", "<leader>te", "<Cmd>lua require('neotest').stop()<CR>", { noremap = true, silent = true })
-- keymap(
--   "n",
--   "<leader>tf",
--   "<Cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
--   { noremap = true, silent = true }
-- )
-- keymap("n", "<leader>tw", "<Cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<CR>", { noremap = true, silent = true })
keymap("n", "<leader>ts", "<Cmd>lua require('neotest').summary.toggle()<CR>", { noremap = true, silent = true })
-- keymap("n", "<leader>to", "<Cmd>lua require('neotest').output.open({ enter = true })<CR>", { noremap = true, silent = true })
keymap("n", "<leader>tp", "<Cmd>lua require('neotest').output_panel.toggle()<CR>", { noremap = true, silent = true })

neotest.setup({
  adapters = {
    require("neotest-plenary")
  }
})

