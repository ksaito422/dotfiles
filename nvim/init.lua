--
--  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
--  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
--  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
--  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
--  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
--  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
--

require("base")
require("keymap")

if not vim.g.vscode then
  require("functions")
  require("plugins")
  require("plugins_load")
  require("lsp")

  -- 不要なデフォルトプラグインを無効化する
  -- 参考: https://zenn.dev/kawarimidoll/articles/8172a4c29a6653
  vim.api.nvim_set_var("did_install_default_menus", 1)
  vim.api.nvim_set_var("did_install_syntax_menu", 1)
  vim.api.nvim_set_var("did_indent_on", 1)
  vim.api.nvim_set_var("loaded_man", 1)
  vim.api.nvim_set_var("loaded_matchit", 1)
  vim.api.nvim_set_var("loaded_matchparen", 1)
  vim.api.nvim_set_var("loaded_tarPlugin", 1)
  vim.api.nvim_set_var("loaded_tutor_mode_plugin", 1)
  vim.api.nvim_set_var("skip_loading_mswin", 1)
end
