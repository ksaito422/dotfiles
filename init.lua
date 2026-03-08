-- Setup Hammer spoon
-- <ctrl+q>でWezTermをアクティブウインドウにする
hs.hotkey.bind({ "CTRL" }, "q", function()
  local wez = hs.application.get("WezTerm")
  if wez == nil then
    hs.application.launchOrFocus("/Applications/WezTerm.app")
  elseif wez:isFrontmost() then
    wez:hide()
  else
    local space = hs.spaces.focusedSpace()
    local win = wez:focusedWindow()
    hs.spaces.moveWindowToSpace(win, space)
    win:focus()
  end
end)

hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})
