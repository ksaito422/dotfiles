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

-- LSPの補完候補の時間をマニュアルトリガーで計測する
local log_file = vim.fn.stdpath("cache") .. "/manual_completion_time.log"

function measure_manual_completion_time()
  local start_time = vim.loop.hrtime() -- リクエスト送信時間

  vim.lsp.buf_request(0, "textDocument/completion", vim.lsp.util.make_position_params(), function(err, result)
    local end_time = vim.loop.hrtime() -- レスポンス受信時間
    local duration = (end_time - start_time) / 1e6 -- ミリ秒に変換

    local log_entry
    if err or not result then
      log_entry = string.format("No completions found (%.2f ms)\n", duration)
    else
      local items = vim.lsp.util.extract_completion_items(result)
      local labels = {}
      for _, item in ipairs(items) do
        table.insert(labels, item.label)
      end
      log_entry = string.format("Completion time: %.2f ms\nLabels: %s\n", duration, table.concat(labels, ", "))
    end

    vim.fn.writefile({ log_entry }, log_file, "a")

    require("notify")(log_entry, "info")
  end)
end

vim.api.nvim_create_user_command("MeasureCompletionTime", function()
  measure_manual_completion_time()
end, {})

-- チートシートを開く
local function open_cheatsheet()
  local cheatsheet = "~/.config/nvim/cheatsheet.md"
  vim.cmd("edit " .. cheatsheet)
end

vim.api.nvim_create_user_command("OpenCheatsheet", function()
  open_cheatsheet()
end, { desc = "Open cheatsheet" })

-- ターミナルをトグルで表示/非表示する
local term_buf = nil
local term_win = nil

function ToggleTerminal()
  -- ターミナルウィンドウがすでに存在し、有効な場合
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    -- ターミナルウィンドウを閉じる
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  -- ターミナルバッファがすでに存在し、有効な場合
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    -- 水平分割で新しいウィンドウを作成
    vim.cmd("split")
    vim.cmd("wincmd j")
    vim.cmd("resize 20")
    -- 既存のターミナルバッファを表示
    vim.api.nvim_win_set_buf(0, term_buf)
    term_win = vim.api.nvim_get_current_win()
    vim.cmd("startinsert")
  else
    -- 新しいターミナルを作成
    vim.cmd("split")
    vim.cmd("wincmd j")
    vim.cmd("resize 20")
    vim.cmd("terminal")
    term_buf = vim.api.nvim_get_current_buf()
    term_win = vim.api.nvim_get_current_win()
    vim.cmd("startinsert")
  end
end

vim.api.nvim_create_user_command("ToggleTerm", ToggleTerminal, { desc = "Toggle terminal" })
vim.api.nvim_set_keymap("n", "<C-t>", ":ToggleTerm<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})
