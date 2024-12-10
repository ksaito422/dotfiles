local aStatus, alpha = pcall(require, "alpha")
if not aStatus then
  return
end

local dStatus, dashboard = pcall(require, "alpha.themes.dashboard")
if not dStatus then
  return
end

dashboard.section.header.val = {
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

dashboard.section.buttons.val = {
  dashboard.button("ff", "󰱽  Find file", ":Telescope find_files <CR>"),
  dashboard.button("fg", "󰱼  Find git managed file", ":Telescope git_files <CR>"),
  dashboard.button("vr", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("fl", "󰊄  Find text", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"),
  dashboard.button("op", "  Seacrh PR", ":Octo pr search<CR>"),
  dashboard.button("oa", "  Seacrh PR author:@me is:open", ":Octo pr search author:@me is:open<CR>"),
  dashboard.button("or", "  Seacrh PR review requested:@me is:open", ":Octo pr search review-requested:@me is:open<CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
  dashboard.button("q", "󰅙  Quit Neovim", ":qa<CR>"),
}

local function footer()
  -- Number of plugins
  local datetime = os.date("%Y-%m-%d %H:%M:%S")
  local plugins_text = "   v"
    .. vim.version().major
    .. "."
    .. vim.version().minor
    .. "."
    .. vim.version().patch
    .. "   "
    .. datetime

  -- Quote
  local fortune = require("alpha.fortune")
  local quote = table.concat(fortune(), "\n")

  return plugins_text .. "\n" .. quote
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
