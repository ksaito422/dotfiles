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

-- <ctrl+x>でvscodeをアクティブウインドウにする
hs.hotkey.bind({ "CTRL" }, "x", function()
  local vscode = hs.application.get("Code")
  if vscode == nil then
    hs.application.launchOrFocus("/Applications/Visual Studio Code.app")
  elseif vscode:isFrontmost() then
    vscode:hide()
  else
    local space = hs.spaces.focusedSpace()
    local win = vscode:focusedWindow()
    hs.spaces.moveWindowToSpace(win, space)
    win:focus()
  end
end)

-- <ctrl+s>でobsidianをアクティブウインドウにする
hs.hotkey.bind({ "CTRL" }, "s", function()
  local obsidian = hs.application.get("Obsidian")
  if obsidian == nil then
    hs.application.launchOrFocus("/Applications/Obsidian.app")
  elseif obsidian:isFrontmost() then
    obsidian:hide()
  else
    local space = hs.spaces.focusedSpace()
    local win = obsidian:focusedWindow()
    hs.spaces.moveWindowToSpace(win, space)
    win:focus()
  end
end)

hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})
