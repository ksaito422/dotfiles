local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  return
end

trouble.setup({
  restore = false,
  auto_close = false,
  auto_open = false,
  auto_preview = true,
  auto_jump = false,
  open_no_results = false,
  auto_refresh = true,
  multiline = false,
  pinned = true,
  focus = true,
  keys = {
    gb = { -- example of a custom action that toggles the active view filter
      action = function(view)
        view:filter({ buf = 0 }, { toggle = true })
      end,
      desc = "Toggle Current Buffer Filter",
    },
    s = { -- example of a custom action that toggles the severity
      action = function(view)
        local f = view:get_filter("severity")
        local severity = ((f and f.filter.severity or 0) + 1) % 5
        view:filter({ severity = severity }, {
          id = "severity",
          template = "{hl:Title}Filter:{hl} {severity}",
          del = severity == 0,
        })
      end,
      desc = "Toggle Severity Filter",
    },
  },
  modes = {
    lsp_references = {
      -- some modes are configurable, see the source code for more details
      params = {
        include_declaration = false,
      },
      desc = "Lsp References",
      mode = "lsp_references",
      win = {
        position = "bottom",
        type = "split",
        relative = "editor",
        size = { height = 0.15, width = 0.15 },
      },
    },
    symbols = {
      desc = "document symbols",
      mode = "lsp_document_symbols",
      focus = false,
      win = {
        position = "right",
        type = "split",
        relative = "editor",
        size = { width = 0.2 },
      },
      filter = {
        -- remove Package since luals uses it for control flow structures
        ["not"] = { ft = "lua", kind = "Package" },
        any = {
          -- all symbol kinds for help / markdown files
          ft = { "help", "markdown" },
          -- default set of symbol kinds
          kind = {
            "Class",
            "Constructor",
            "Enum",
            "Field",
            "Function",
            "Interface",
            "Method",
            "Module",
            "Namespace",
            "Package",
            "Property",
            "Struct",
            "Trait",
          },
        },
      },
    },
    diagnostics = {
      desc = "diagnostics",
      mode = "diagnostics",
      focus = false,
      win = {
        position = "bottom",
        type = "split",
        relative = "editor",
        size = { height = 0.15, width = 0.5 },
      },
    },
  },
})
