local status_ok, indent_blankline = pcall(require, 'ibl')
if not status_ok then
    return
end

local opt = vim.opt

opt.list = true
opt.listchars:append('space:⋅')
opt.listchars:append('eol:↴')

indent_blankline.setup({})
