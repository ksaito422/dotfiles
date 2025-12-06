local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

local nvic_status_ok, navic = pcall(require, "nvim-navic")
if not nvic_status_ok then
  return
end

vim.o.winbar = " %{%v:lua.vim.fn.expand('%F')%} %{%v:lua.require'nvim-navic'.get_location()%}"

-------------------------------------------------------------------
-- nvim-lspconfig
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

nvim_lsp.ruby_lsp.setup({
  on_attach = on_attach,
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git"),
  init_options = {
    formatting = "auto",
  },
  single_file_support = true,
})
nvim_lsp.clangd.setup({ on_attach = on_attach })
nvim_lsp.lua_ls.setup({
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
nvim_lsp.tflint.setup({ on_attach = on_attach })
nvim_lsp.terraformls.setup({ on_attach = on_attach })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.lsp.buf.format()
  end,
})
nvim_lsp.ts_ls.setup({
  on_attach = on_attach,
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "javascript.jsx",
    "typescript.tsx",
  },
  cmd = { "typescript-language-server", "--stdio" },
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

nvim_lsp.efm.setup({
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

nvim_lsp.typos_lsp.setup({
  on_attach = on_attach,
  cmd = { "typos-lsp" },
  init_options = {
    config = '~/.config/nvim/spell/typos.toml',
  },
})
