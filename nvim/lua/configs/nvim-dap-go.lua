local status_ok_dap_go, dap_go = pcall(require, 'dap-go')
if not status_ok_dap_go then
    return
end
dap_go.setup()
