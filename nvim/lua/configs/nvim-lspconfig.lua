local keymap = vim.api.nvim_set_keymap
local mStatus_ok, mason = pcall(require, 'mason')
if not mStatus_ok then
    return
end

local mlStatus_ok, mason_lsp = pcall(require, 'mason-lspconfig')
if not mlStatus_ok then
    return
end

local lStatus_ok, nvim_lsp = pcall(require, 'lspconfig')
if not lStatus_ok then
    return
end

-------------------------------------------------------------------
-- mason
-------------------------------------------------------------------
mason.setup({
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
    },
})

-------------------------------------------------------------------
-- mason lsp
-------------------------------------------------------------------
mason_lsp.setup()

-------------------------------------------------------------------
-- nvim-lspconfig
-------------------------------------------------------------------
local on_attach = function(client, bufnr)
    -- formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('Format', { clear = true }),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
            desc = '[lsp] format on save',
        })
    end
end

-- NOTE: lsp sagaにもlsp関連のコマンドあり
keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
-- keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
keymap('n', '<space><space>', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

nvim_lsp.gopls.setup({ on_attach = on_attach })
nvim_lsp.solargraph.setup({
    on_attach = on_attach,
    init_options = {
        formatting = true,
    },
    -- https://medium.com/@cristianvg/neovim-lsp-your-rbenv-gemset-and-solargraph-8896cb3df453
    -- default { "solargraph", "stdio" }
    cmd = { os.getenv('HOME') .. '/.rbenv/shims/solargraph', 'stdio' },
    root_dir = nvim_lsp.util.root_pattern('Gemfile', '.git'),
    settings = {
        solargraph = {
            -- null-lsでrubocopを扱うため、nvim-lsp&masonのsolargraphに入っているrubocopの診断はoffにする
            -- 2重で診断結果が表示されるため
            diagnostics = false,
        },
    },
})
nvim_lsp.clangd.setup({ on_attach = on_attach })
nvim_lsp.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
nvim_lsp.tflint.setup({ on_attach = on_attach })
nvim_lsp.terraform_lsp.setup({ on_attach = on_attach })
nvim_lsp.tsserver.setup({
    on_attach = on_attach,
    filetypes = {
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'javascript.jsx',
        'typescript.tsx',
    },
    cmd = { 'typescript-language-server', '--stdio' },
})
