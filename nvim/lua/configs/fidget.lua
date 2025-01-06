local keymap = vim.api.nvim_set_keymap
local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
  return
end

fidget.setup({
  progress = {
    lsp = {
      progress_ringbuf_size = 0,
      log_handler = true,
    },
  },
  notification = {
    history_size = 128,
    override_vim_notify = true,
  },
  logger = {
    level = vim.log.levels.INFO,
    path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
  },
})

keymap("n", "<leader>fh", ":Fidget history<CR>", { noremap = true, silent = true })
