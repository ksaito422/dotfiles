local nvim_create_user_command = vim.api.nvim_create_user_command

-- TODO: 直す
-- Normal mode切り替え時に日本語入力をoffにする
nvim_create_user_command('DisableIme', function()
    vim.cmd([[
	function! s:disableIme()
		if has('mac')
			call jobstart(['osascript', '-e', 'tell application "System Events" to key code {102}'], {'in_io': 'null', 'out_io': 'null', 'err_io': 'null'})
		endif
	endfunction
]])
end, {})
