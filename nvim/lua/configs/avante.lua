local keymap = vim.api.nvim_set_keymap
local status_ok, avante = pcall(require, "avante")
if not status_ok then
  return
end

keymap("n", "<leader>aa", "<cmd>AvanteToggle<CR>", { noremap = true, silent = true }) -- ask mode
keymap("n", "<leader>ac", "<cmd>AvanteChat<CR>", { noremap = true, silent = true }) -- chat mode
keymap("n", "<leader>ar", "<cmd>AvanteRefresh<CR>", { noremap = true, silent = true })
keymap("n", "<leader>ax", "<cmd>AvanteClear<CR>", { noremap = true, silent = true })

avante.setup({
  provider = "copilot",
  auto_suggestions_provider = "copilot",
  cursor_applying_provider = "copilot",
  copilot = {
    endpoint = "https://api.githubcopilot.com",
    model = "claude-3.7-sonnet",
  },
  behavior = {
    auto_suggestions = false,
    auto_set_highligght_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = true,
    support_paste_from_clipboard = true,
    minimize_diff = true,
    enable_token_counting = true,
    enable_cursor_planning_mode = true,
  },
})

local prompts = {
  Explain = "このコードの処理について説明してください。",
  Fix = "このコードにバグがあれば、説明をして修正案を出してください。",
  Optimize = "このコードを最適化してください。",
  Test = "このコードのテストをプロジェクトで使用しているテストフレームワークに従って書いてください。",
  Refactor = "このコードをより読みやすく、メンテナンスしやすくリファクタリングしてください。",
}

for command, question in pairs(prompts) do
  vim.api.nvim_create_user_command("Avante" .. command, function()
    require('avante.api').ask { question = question }
  end, { range = true })
end

keymap("v", "<leader>ae", "<cmd>AvanteExplain<CR>", { noremap = true, silent = true })
keymap("n", "<leader>ae", "<cmd>AvanteExplain<CR>", { noremap = true, silent = true })
keymap("v", "<leader>af", "<cmd>AvanteFix<CR>", { noremap = true, silent = true })
keymap("n", "<leader>af", "<cmd>AvanteFix<CR>", { noremap = true, silent = true })
keymap("v", "<leader>ao", "<cmd>AvanteOptimize<CR>", { noremap = true, silent = true })
keymap("n", "<leader>ao", "<cmd>AvanteOptimize<CR>", { noremap = true, silent = true })
keymap("v", "<leader>at", "<cmd>AvanteTest<CR>", { noremap = true, silent = true })
keymap("n", "<leader>at", "<cmd>AvanteTest<CR>", { noremap = true, silent = true })
keymap("v", "<leader>ar", "<cmd>AvanteRefactor<CR>", { noremap = true, silent = true })
keymap("n", "<leader>ar", "<cmd>AvanteRefactor<CR>", { noremap = true, silent = true })

