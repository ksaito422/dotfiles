local M = {}
local wezterm = require('wezterm')
local utils = require('utils')
local act = wezterm.action

M.leader = { key = 'q', mods = 'SUPER' }

M.tmux_keybinds = {
    { key = 't', mods = 'SUPER', action = act({ SpawnTab = 'CurrentPaneDomain' }) },
    { key = 'w', mods = 'SUPER', action = act({ CloseCurrentTab = { confirm = true } }) },
    { key = 'Tab', mods = 'CTRL', action = act({ ActivateTabRelative = 1 }) },
    { key = 'Tab', mods = 'CTRL|SHIFT', action = act({ ActivateTabRelative = -1 }) },
}

M.default_keybinds = {
    {
        key = 'r',
        mods = 'LEADER',
        action = act.ActivateKeyTable({
            name = 'resize_pane',
            one_shot = false,
        }),
    },
    {
        key = 'a',
        mods = 'LEADER',
        action = act.ActivateKeyTable({
            name = 'activate_pane',
            one_shot = false,
        }),
    },
    {
        key = 'f',
        mods = 'LEADER',
        action = act.Search({
            CaseSensitiveString = '',
        }),
    },
    {
        key = '\\',
        mods = 'CTRL',
        action = act({
            SplitHorizontal = { domain = 'CurrentPaneDomain' },
        }),
    },
    {
        key = '\'',
        mods = 'CTRL',
        action = act({
            SplitVertical = { domain = 'CurrentPaneDomain' },
        }),
    },
    { key = 'c', mods = 'SUPER', action = act({ CopyTo = 'Clipboard' }) },
    { key = 'v', mods = 'SUPER', action = act({ PasteFrom = 'Clipboard' }) },
    { key = 'PageUp', mods = 'CTRL', action = act({ ScrollByPage = -1 }) },
    { key = 'PageDown', mods = 'CTRL', action = act({ ScrollByPage = 1 }) },
    { key = 'h', mods = 'SUPER', action = act.HideApplication },
    { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
    { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
    { key = '0', mods = 'CTRL', action = act.ResetFontSize },
    { key = '[', mods = 'SUPER|CTRL', action = act.MoveTabRelative(-1) },
    { key = ']', mods = 'SUPER|CTRL', action = act.MoveTabRelative(1) },
}

function M.create_keybinds()
    return utils.merge_lists(M.default_keybinds, M.tmux_keybinds)
end

M.key_tables = {
    resize_pane = {
        { key = 'LeftArrow', action = act.AdjustPaneSize({ 'Left', 1 }) },
        { key = 'h', action = act.AdjustPaneSize({ 'Left', 1 }) },
        { key = 'RightArrow', action = act.AdjustPaneSize({ 'Right', 1 }) },
        { key = 'l', action = act.AdjustPaneSize({ 'Right', 1 }) },
        { key = 'UpArrow', action = act.AdjustPaneSize({ 'Up', 1 }) },
        { key = 'k', action = act.AdjustPaneSize({ 'Up', 1 }) },
        { key = 'DownArrow', action = act.AdjustPaneSize({ 'Down', 1 }) },
        { key = 'j', action = act.AdjustPaneSize({ 'Down', 1 }) },
        -- Cancel the mode by pressing escape
        { key = 'Escape', action = 'PopKeyTable' },
    },
    activate_pane = {
        { key = 'LeftArrow', action = act.ActivatePaneDirection('Left') },
        { key = 'h', action = act.ActivatePaneDirection('Left') },
        { key = 'RightArrow', action = act.ActivatePaneDirection('Right') },
        { key = 'l', action = act.ActivatePaneDirection('Right') },
        { key = 'UpArrow', action = act.ActivatePaneDirection('Up') },
        { key = 'k', action = act.ActivatePaneDirection('Up') },
        { key = 'DownArrow', action = act.ActivatePaneDirection('Down') },
        { key = 'j', action = act.ActivatePaneDirection('Down') },
        -- Cancel the mode by pressing escape
        { key = 'Escape', action = 'PopKeyTable' },
    },
}

return M
