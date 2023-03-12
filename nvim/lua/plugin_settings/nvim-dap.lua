local status_ok_dap, dap = pcall(require, 'dap')
if not status_ok_dap then
	return
end

local status_ok_dapui, dapui = pcall(require, 'dapui')
if not status_ok_dapui then
	return
end

local keymap = vim.api.nvim_set_keymap

-- dap起動時にdap-uiを表示する
dap.listeners.before['event_initialized']['custom'] = function(session, body)
	dapui.open()
end

-- dap停止時にdap-uiを閉じる
dap.listeners.before['event_terminated']['custom'] = function(session, body)
	dapui.close()
end

-- key mappings
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then options = vim.tbl_extend('force', options, opts) end
	keymap(mode, lhs, rhs, options)
end

-- dap key map
map('n', '<F5>', ':lua require"dap".continue()<CR>', { silent = true })
map('n', '<F10>', ':lua require"dap".step_over()<CR>', { silent = true })
map('n', '<F11>', ':lua require"dap".step_into()<CR>', { silent = true })
map('n', '<F12>', ':lua require"dap".step_out()<CR>', { silent = true })
map('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>', { silent = true })
map('n', '<leader>bc', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { silent = true })
map('n', '<leader>l', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
	{ silent = true })

-- dap-ui key map
map('n', '<leader>d', ':lua require"dapui".toggle()<CR>', { silent = true })
map('n', '<leader><leader>df', ':lua require"dapui".eval()<CR>', { silent = true })

-- dap-go key map
map('n', '<leader>td', ':lua require"dap-go".debug_test()<CR>', { silent = true })

dap.set_log_level("TRACE")

-- ---------------------------------
-- Debugger for Golang
-- ---------------------------------
dap.adapters.go = function(callback, config)
	local stdout = vim.loop.new_pipe(false)
	local handle
	local pid_or_err
	local port = 38697
	local opts = {
		stdio = { nil, stdout },
		args = { 'dap', '-l', '127.0.0.1:' .. port },
		detached = true
	}
	handle, pid_or_err = vim.loop.spawn('dlv', opts, function(code)
		stdout:close()
		handle:close()
		if code ~= 0 then
			print('dlv exited with code', code)
		end
	end)
	assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
	stdout:read_start(function(err, chunk)
		assert(not err, err)
		if chunk then
			vim.schedule(function()
				require('dap.repl').append(chunk)
			end)
		end
	end)
	-- Wait for delve to start
	vim.defer_fn(
		function()
			callback({ type = 'server', host = '127.0.0.1', port = port })
		end,
		100)
end

dap.configurations.go = {
	{
		type = 'go',
		name = 'Debug the golang',
		request = 'launch',
		program = '${file}',
	},
	{
		type = 'go',
		name = 'Debug the golang test',
		request = 'launch',
		mode = 'test',
		program = '${file}',
	},
	{
		type = 'go',
		name = 'Debug test (go.mod)',
		request = 'launch',
		mode = 'test',
		program = './${relativeFileDirname}',
	}
}

-- ---------------------------------
-- Debugger for Ruby
-- usage: rdbg --open --port 38698 -- <ファイル名.rb>
-- ---------------------------------
dap.adapters.ruby = function(callback, config)
	local stdout = vim.loop.new_pipe(false)
	local handle
	local pid_or_err
	local port = 38698
	local opts = {
		stdio = { nil, stdout },
		args = { "--open", "--port", port, "--" },
		detached = true
	}
	handle, pid_or_err = vim.loop.spawn("rdbg", opts, function(code)
		stdout:close()
		handle:close()
		if code ~= 0 then
			print('rdbg exited with code', code)
		end
	end)
	assert(handle, 'Error running rgdb: ' .. tostring(pid_or_err))
	stdout:read_start(function(err, chunk)
		assert(not err, err)
		if chunk then
			vim.schedule(function()
				require('dap.repl').append(chunk)
			end)
		end
	end)
	-- Wait for rdbg to start
	vim.defer_fn(
		function()
			callback({type = "server", host = "127.0.0.1", port = port})
		end,
	100)
end

dap.configurations.ruby = {
	{
		type = 'ruby',
		name = 'Debug current file with rdbg',
		request = 'launch',
		script = '${file}',
	},
	{
		type = 'ruby',
		name = 'Run current spec file',
		request = 'launch',
		mode = 'test',
		script = '${file}',
	},
	{
		type = 'ruby',
		name = 'Run rspec',
		request = 'launch',
		mode = 'test',
		script = './${relativeFileDirname}',
	}
}
