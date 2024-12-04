local status, saga = pcall(require, "lspsaga")
if not status then
  return
end

local keymap = vim.keymap.set

saga.setup({
  request_timeout = 10000,
  ui = {
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = { "●", "─", "●", "│", "●", "─", "●", "│" },
    winblend = 0,
    expand = "",
    collapse = "",
    code_action = "💡",
    incoming = " ",
    outgoing = " ",
    hover = " ",
    kind = {},
  },
})

-- NOTE: lsp configにもlsp関連のコマンドあり
-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++quiet<CR>", { noremap = true, silent = true })
keymap("n", "gh", "<cmd>Lspsaga finder<CR>", { noremap = true, silent = true })
keymap("n", "gs", "<cmd>Lspsaga show_buf_diagnostics<CR>", { noremap = true, silent = true })
-- keymap("n", "rn", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true })
-- keymap("n", "ga", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true })
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = true })
keymap("n", "go", "<cmd>Lspsaga outline<CR>", { noremap = true, silent = true })
