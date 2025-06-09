local keymap = vim.api.nvim_set_keymap
local status_ok, claude_code = pcall(require, "claude-code")
if not status_ok then
  return
end

keymap("n", "<C-,>", "<cmd>ClaudeCode<CR>", { noremap = true, silent = true })
keymap("n", "<leader>cc", "<cmd>ClaudeCodeContinue<CR>", { noremap = true, silent = true })
keymap("n", "<leader>cr", "<cmd>ClaudeCodeResume<CR>", { noremap = true, silent = true })

claude_code.setup({
  command = "claude",
  window = {
    split_ratio = 0.3, -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
    position = "vertical", -- Position of the window: "botright", "topleft", "vertical", "rightbelow vsplit", etc.
    enter_insert = true, -- Whether to enter insert mode when opening Claude Code
    hide_numbers = true, -- Hide line numbers in the terminal window
    hide_signcolumn = true, -- Hide the sign column in the terminal window
  },
  refresh = {
    enable = true, -- Enable file change detection
    updatetime = 100, -- updatetime when Claude Code is active (milliseconds)
    timer_interval = 1000, -- How often to check for file changes (milliseconds)
    show_notifications = true, -- Show notification when files are reloaded
  },
})
