local status_ok, copilot_lsp = pcall(require, "copilot-lsp")
if not status_ok then
  return
end

copilot_lsp.setup({
  nes = {
    move_count_threshold = 3,
  },
})

vim.lsp.enable("copilot_ls")
vim.g.copilot_nes_debounce = 500

vim.keymap.set("n", "<tab>", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local state = vim.b[bufnr].nes_state
  if state then
    local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
      or (require("copilot-lsp.nes").apply_pending_nes() and require("copilot-lsp.nes").walk_cursor_end_edit())
    return nil
  else
    return "<C-i>"
  end
end, { desc = "Accept Copilot NES suggestion", expr = true })

vim.keymap.set("n", "<esc>", function()
  if not require("copilot-lsp.nes").clear() then
  end
end, { desc = "Clear Copilot suggestion or fallback" })
