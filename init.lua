-- Setup Hammer spoon
-- <ctrl+q>でweztermをアクティブウインドウにする
hs.hotkey.bind({ 'CTRL' }, 'q', function()
	local wez = hs.application.get('wezterm')
	if wez == nil then
		hs.application.launchOrFocus('/Applications/wezterm.app')
	elseif wez:isFrontmost() then
		wez:hide()
	else
		local space = hs.spaces.focusedSpace()
		local win = wez:focusedWindow()
		hs.spaces.moveWindowToSpace(win, space)
		win:focus()
	end
end)
