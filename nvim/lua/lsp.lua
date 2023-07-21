vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    -- LSPの診断結果を行末にvirtual_textで表示する
    virtual_text = true,
    format = function(diagnostic)
        return string.format('%s (%s: %s)', diagnostic.message, diagnostic.source, diagnostic.code)
    end,
})

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
vim.cmd('sign define DiagnosticSignError text=E texthl=DiagnosticSignError linehl= numhl=')
vim.cmd('sign define DiagnosticSignWarn text=W texthl=DiagnosticSignWarn linehl= numhl=')
vim.cmd('sign define DiagnosticSignInfo text=I texthl=DiagnosticSignInfo linehl= numhl=')
-- vim.cmd 'sign define DiagnosticSignHint text=H texthl=DiagnosticSignHint linehl= numhl='
