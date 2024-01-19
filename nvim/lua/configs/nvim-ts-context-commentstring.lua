local status_ok, ts_context_commentstring = pcall(require, 'ts_context_commentstring')
if not status_ok then
    return
end

local g = vim.g

ts_context_commentstring.setup({
    skip_ts_context_commentstring_module = true,
    enable_autocmd = false,
    languages = {
        javascript = {
            __default = '// %s',
            -- jsx_element = "{/* %s */}",
            -- jsx_fragment = "{/* %s */}",
            -- jsx_attribute = "// %s",
            comment = '// %s',
        },
    },
})
