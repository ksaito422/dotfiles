local aStatus, alpha = pcall(require, 'alpha')
if not aStatus then
    return
end

local dStatus, dashboard = pcall(require, 'alpha.themes.dashboard')
if not dStatus then
    return
end

dashboard.section.header.val = {
    '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
    '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
    '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
    '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
    '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
    '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
}

dashboard.section.buttons.val = {
    dashboard.button('f', '󰱽  Find file', ':Telescope find_files <CR>'),
    dashboard.button('g', '󰱼  Find git managed file', ':Telescope git_files <CR>'),
    dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
    dashboard.button('r', '  Recently used files', ':Telescope oldfiles <CR>'),
    dashboard.button('t', '󰊄  Find text', ':Telescope live_grep <CR>'),
    dashboard.button('c', '  Configuration', ':e $MYVIMRC<CR>'),
    dashboard.button('q', '󰅙  Quit Neovim', ':qa<CR>'),
}

local function footer()
    -- Number of plugins
    local datetime = os.date('%Y-%m-%d %H:%M:%S')
    local plugins_text = '   v'
        .. vim.version().major
        .. '.'
        .. vim.version().minor
        .. '.'
        .. vim.version().patch
        .. '   '
        .. datetime

    -- Quote
    local fortune = require('alpha.fortune')
    local quote = table.concat(fortune(), '\n')

    return plugins_text .. '\n' .. quote
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = 'Type'
dashboard.section.header.opts.hl = 'Include'
dashboard.section.buttons.opts.hl = 'Keyword'

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
