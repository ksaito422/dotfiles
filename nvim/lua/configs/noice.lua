local noice_status_ok, noice = pcall(require, "noice")
if not noice_status_ok then
  return
end

local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
  return
end

noice.setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  messages = {
    enabled = true,
    view = "mini",
    view_error = "mini",
    view_warn = "mini",
    view_history = "mini",
    view_search = "mini",
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  popupmenu = {
    enabled = false, -- enables the Noice popupmenu UI
    ---@type 'nui'|'cmp'
    backend = "nui", -- backend to use to show regular cmdline completions
    ---@type NoicePopupmenuItemKind|false
    -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
    kind_icons = {}, -- set to `false` to disable icons
  },
  hover = {
    enabled = true,
    silent = false, -- set to true to not show a message if hover is not available
    view = nil, -- when nil, use defaults from documentation
    ---@type NoiceViewOptions
    opts = {}, -- merged with defaults from documentation
  },
  signature = {
    enabled = true,
    defaults_open = {
      enabled = true,
      trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
      luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
      throttle = 50, -- Debounce lsp signature help request by 50ms
    },
    view = nil, -- when nil, use defaults from documentation
    ---@type NoiceViewOptions
    opts = {}, -- merged with defaults from documentation
  },
})
