--
--  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
--  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
--  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
--  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
--  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
--  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
--

require('base')
require('keymap')
require('functions')
require('plugins')
require('plugins_load')

-- PackerCompileを自動実行
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]
