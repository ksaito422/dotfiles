local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

copilot.setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
  filetypes = {
    ruby = false,
    lua = false,
    javascript = false,
    typescript = false,
    markdown = false,
    terraform = false,
    yaml = false,
    gitcommit = false,
  },
})
