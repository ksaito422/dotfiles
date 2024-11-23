local status_ok, hlchunk = pcall(require, "hlchunk")
if not status_ok then
  return
end

local support_filetypes = {
  "*.lua",
  "*.rb",
  "*.erb",
  "*.haml",
  "*.js",
  "*.jsx",
  "*.ts",
  "*.tsx",
}

hlchunk.setup({
  chunk = {
    enable = true,
    notify = true,
    use_treesitter = true,
    support_filetypes = support_filetypes,
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
      right_arrow = ">",
    },
    style = {
      { fg = "#806d9c" },
      { fg = "#c21f30" }, -- this fg is used to highlight wrong chunk
    },
    textobject = "",
    max_file_size = 1024 * 1024,
    error_sign = true,
  },

  indent = {
    enable = true,
    use_treesitter = true,
    chars = {
      "│",
    },
    style = {
      { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") },
    },
  },

  line_num = {
    enable = false,
    use_treesitter = false,
    style = "#806d9c",
    support_filetypes = support_filetypes,
  },

  blank = {
    enable = true,
    chars = {
      "․",
    },
    style = {
      vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
    },
  },
})
