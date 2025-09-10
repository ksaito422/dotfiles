local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

copilot.setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
  filetypes = {
    ruby = true,
    lua = true,
    javascript = true,
    typescript = true,
    markdown = true,
    terraform = true,
    yaml = true,
    gitcommit = true,
  },
  copilot_model = "claude-4.0-sonnet"
})
