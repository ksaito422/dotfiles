local keymap = vim.api.nvim_set_keymap
local status_ok, csvview = pcall(require, "csvview")
if not status_ok then
  return
end

csvview.setup({
  parser = { comments = { "#", "//" } },
  view = { display_mode = "border", },
  keymaps = {
    textobject_field_inner = { "if", mode = { "o", "x" } },
    textobject_field_outer = { "af", mode = { "o", "x" } },
    jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
    jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
    jump_next_row = { "<Enter>", mode = { "n", "v" } },
    jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
  },
})

keymap("n", "<leader>cv", ":CsvViewToggle<CR>", { noremap = true, silent = true })
