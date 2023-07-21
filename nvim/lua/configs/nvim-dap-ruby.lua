local status_ok_dap_ruby, dap_ruby = pcall(require, 'dap-ruby')
if not status_ok_dap_ruby then
    return
end
dap_ruby.setup()
