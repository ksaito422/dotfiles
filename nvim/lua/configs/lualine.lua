local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    -- theme = 'tokyonight',
    -- theme = 'gruber-darker',
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filetype", icon_only = true }, { "filename", path = 1 }, { "searchcount" } },
    lualine_x = { "encoding", "fileformat" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
