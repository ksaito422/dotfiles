-- dap起動時にdap-uiを表示する
require'dap'.listeners.before['event_initialized']['custom'] = function(session, body)
	require'dapui'.open()
end

-- dap停止時にdap-uiを閉じる
require'dap'.listeners.before['event_terminated']['custom'] = function(session, body)
	require'dapui'.close()
end

-- key mappings
local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- dap key map
map("n", "<F5>", ":lua require'dap'.continue()<CR>", { silent = true})
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { silent = true})
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { silent = true})
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { silent = true})
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true})
map("n", "<leader>bc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { silent = true})
map("n", "<leader>l", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { silent = true})

-- dap-ui key map
map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true})
map("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { silent = true})

-- dap-go key map
map("n", "<leader>td", ":lua require'dap-go'.debug_test()<CR>", { silent = true })

