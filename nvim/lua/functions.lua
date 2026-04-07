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
  local start_time = vim.uv.hrtime() -- リクエスト送信時間

  vim.lsp.buf_request(0, "textDocument/completion", vim.lsp.util.make_position_params(), function(err, result)
    local end_time = vim.uv.hrtime() -- レスポンス受信時間
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

-- ターミナルをトグルで表示/非表示する
local term_state = {
  s = { buf = nil, win = nil },
  v = { buf = nil, win = nil },
  c = { buf = nil, win = nil, prev_buf = nil },
}

function ToggleTerminal(mode)
  local state = term_state[mode]

  if mode == "s" or mode == "v" then
    -- ウィンドウが有効 → close
    if state.win and vim.api.nvim_win_is_valid(state.win) then
      vim.api.nvim_win_close(state.win, true)
      state.win = nil
      return
    end

    local split_cmd = mode == "s" and "split" or "vsplit"

    -- バッファが有効 → 再表示
    if state.buf and vim.api.nvim_buf_is_valid(state.buf) then
      vim.cmd(split_cmd)
      if mode == "s" then
        vim.cmd("wincmd j")
        vim.cmd("resize 20")
      else
        vim.cmd("wincmd l")
        vim.cmd("vertical resize 80")
      end
      vim.api.nvim_win_set_buf(0, state.buf)
      state.win = vim.api.nvim_get_current_win()
      vim.cmd("startinsert")
    else
      -- 新規作成
      vim.cmd(split_cmd)
      if mode == "s" then
        vim.cmd("wincmd j")
        vim.cmd("resize 20")
      else
        vim.cmd("wincmd l")
        vim.cmd("vertical resize 80")
      end
      vim.cmd("terminal")
      state.buf = vim.api.nvim_get_current_buf()
      state.win = vim.api.nvim_get_current_win()
      vim.cmd("startinsert")
    end
  else
    -- mode == "c"（カレントウィンドウ）
    local cur_buf = vim.api.nvim_get_current_buf()

    -- 現在のバッファがターミナル → prev_buf に戻す
    if cur_buf == state.buf then
      if state.prev_buf and vim.api.nvim_buf_is_valid(state.prev_buf) then
        vim.api.nvim_win_set_buf(0, state.prev_buf)
      end
      return
    end

    -- ターミナルバッファが有効 → カレントウィンドウで表示
    if state.buf and vim.api.nvim_buf_is_valid(state.buf) then
      state.prev_buf = cur_buf
      vim.api.nvim_win_set_buf(0, state.buf)
      vim.cmd("startinsert")
    else
      -- 新規作成
      state.prev_buf = cur_buf
      vim.cmd("terminal")
      state.buf = vim.api.nvim_get_current_buf()
      vim.cmd("startinsert")
    end
  end
end

vim.api.nvim_create_user_command("ToggleTerm", function(opts)
  ToggleTerminal(opts.args ~= "" and opts.args or "c")
end, { nargs = "?", desc = "Toggle terminal (s=split, v=vsplit, default=current)" })
vim.api.nvim_set_keymap("n", "<C-t>", ":ToggleTerm<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.hl.on_yank({ timeout = 200 })
  end,
})
