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

