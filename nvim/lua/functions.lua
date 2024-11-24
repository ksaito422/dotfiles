-- Insert modeを抜ける時にIMEをローマ字入力に変える
-- dependencies: im-select
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.fn.system("im-select com.google.inputmethod.Japanese.Roman")
  end,
})

-- 行番号の表示を相対と絶対で切り替える
function ToggleRelativeNumber()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    vim.wo.number = true
  else
    vim.wo.relativenumber = true
    vim.wo.number = true
  end
end
vim.api.nvim_create_user_command("ToggleRelNum", ToggleRelativeNumber, {})
vim.api.nvim_set_keymap("n", "<F2>", ":ToggleRelNum<CR>", { noremap = true, silent = true })
