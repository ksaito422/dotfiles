vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      return string.format("%s: %s [%s]", diagnostic.source, diagnostic.message, diagnostic.code)
    end,
  },
  update_in_insert = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  float = {
    border = { "●", "─", "●", "│", "●", "─", "●", "│" },
    source = "always",
    focusable = true,
  },
})

vim.lsp.util.open_floating_preview = (function(orig)
  return function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = { "●", "─", "●", "│", "●", "─", "●", "│" }
    return orig(contents, syntax, opts, ...)
  end
end)(vim.lsp.util.open_floating_preview)

-- LSP診断結果のvirtual textの色
-- vim.cmd 'highlight DiagnosticVirtualTextError guifg=none'
-- vim.cmd 'highlight DiagnosticVirtualTextWarn guifg=none'
-- vim.cmd 'highlight DiagnosticVirtualTextInfo guifg=none'
-- vim.cmd 'highlight DiagnosticVirtualTextHint guibg=none guifg='

-- LSP診断結果のsign columnの色
-- vim.cmd 'highlight DiagnosticsSignError guibg=none guifg=none'
-- vim.cmd 'highlight DiagnosticSignWarn guibg=none guifg=none'
-- vim.cmd 'highlight DiagnosticSignInfo guibg=none guifg='
-- vim.cmd 'highlight DiagnosticSignHint guibg=none guifg='

-- LSP診断結果のsign columnに表示する文字
-- vim.cmd("sign define DiagnosticSignError text=E texthl=DiagnosticSignError linehl= numhl=")
-- vim.cmd("sign define DiagnosticSignWarn text=W texthl=DiagnosticSignWarn linehl= numhl=")
-- vim.cmd("sign define DiagnosticSignInfo text=I texthl=DiagnosticSignInfo linehl= numhl=")
-- vim.cmd 'sign define DiagnosticSignHint text=H texthl=DiagnosticSignHint linehl= numhl='

local keymap = vim.api.nvim_set_keymap
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
keymap("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
keymap("n", "<space><space>", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

keymap("n", "gh", "<cmd>Trouble lsp_references toggle<CR>", { noremap = true, silent = true })
keymap("n", "gs", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { noremap = true, silent = true })
keymap("n", "go", "<cmd>Trouble symbols toggle<CR>", { noremap = true, silent = true })
