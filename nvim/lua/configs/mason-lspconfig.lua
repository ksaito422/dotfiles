local status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

mason_lsp.setup()

