local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local m_status_ok, mason = pcall(require, "mason")
if not m_status_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local ml_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not ml_status_ok then
  return
end

mason_lsp.setup()

local nvic_status_ok, navic = pcall(require, "nvim-navic")
if not nvic_status_ok then
  return
end

vim.o.winbar = " %{%v:lua.vim.fn.expand('%F')%} %{%v:lua.require'nvim-navic'.get_location()%}"

-------------------------------------------------------------------
-- lsp setup
-------------------------------------------------------------------
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
  -- format on save
  -- if client.server_capabilities.documentFormattingProvider then
  --     vim.api.nvim_create_autocmd('BufWritePre', {
  --         group = vim.api.nvim_create_augroup('Format', { clear = true }),
  --         buffer = bufnr,
  --         callback = function()
  --             vim.lsp.buf.format({ bufnr = bufnr })
  --         end,
  --         desc = '[lsp] format on save',
  --     })
  -- end
end

vim.lsp.enable({
  "ruby_lsp",
  "ts_ls",
  "clangd",
  "lua_ls",
  "tflint",
  "terraformls",
  "efm",
})

vim.lsp.config("ruby_lsp", {
  on_attach = on_attach,
})
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
})
vim.lsp.config("clangd", {
  on_attach = on_attach,
})
vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  settings = {
    Lua = {
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
      diagnostics = { enable = false },
      format = { enable = false },
    },
  },
})
vim.lsp.config("tflint", {
  on_attach = on_attach,
})
vim.lsp.config("terraformls", {
  on_attach = on_attach,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

local efm_config = {
  eslint = {
    lintCommand = "./node_modules/.bin/eslint",
    rootMarkers = { "package.json" },
  },
  prettier = {
    formatCommand = "./node_modules/.bin/prettier",
    rootMarkers = { "package.json" },
  },
  stylua = {
    formatCommand = "stylua --config-path .stylua.toml --stdin-filepath ${INPUT} -",
    formatStdin = true,
    rootMarkers = { "stylua.toml", ".stylua.toml" },
  },
  selene = {
    lintCommand = "selene --display-style quiet ${INPUT} -",
    lintStdin = true,
    rootMarkers = { "selene.toml" },
    lintFormats = { "%f:%l:%c: %t%*[^:]: %m" },
  },
}

vim.lsp.config("efm", {
  on_attach = on_attach,
  cmd = { "efm-langserver", "-logfile", "/tmp/efm.log", "-loglevel", "5" },
  init_options = { documentFormatting = true, codeAction = false },
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "lua",
    "terraform",
  },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      javascript = { efm_config.eslint, efm_config.prettier },
      typescript = { efm_config.eslint, efm_config.prettier },
      javascriptreact = { efm_config.eslint, efm_config.prettier },
      typescriptreact = { efm_config.eslint, efm_config.prettier },
      lua = { efm_config.stylua, efm_config.selene },
      hcl = { efm_config.terraform },
      terraform = { efm_config.terraform },
    },
  },
  logLevel = vim.lsp.protocol.MessageType.Log,
})
