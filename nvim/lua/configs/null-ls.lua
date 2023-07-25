local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

null_ls.setup({
    sources = {
        -- js,ts,jsx,tsx
        -- ローカルおよびグローバルのeslintのコード診断機能を利用する
        null_ls.builtins.diagnostics.eslint.with({
            prefer_local = 'node_modules/.bin', -- プロジェクトローカルがある場合はそれを利用
        }),
        -- ローカルおよびグローバルのPrettierをFormatに利用する
        null_ls.builtins.formatting.prettier.with({
            prefer_local = 'node_modules/.bin', -- プロジェクトローカルがある場合はそれを利用
        }),
        -- ruby
        null_ls.builtins.diagnostics.rubocop.with({
            condition = function(utils)
                return utils.root_has_file({ '.rubocop.yml' })
            end,
            command = 'bundle',
            args = vim.list_extend({ 'exec', 'rubocop' }, null_ls.builtins.diagnostics.rubocop._opts.args),
        }),
        -- NOTE: mason solargraphで実行する
        -- null_ls.builtins.formatting.rubocop.with({
        --     condition = function(utils)
        --         return utils.root_has_file({ '.rubocop.yml' })
        --     end,
        --     timeout_ms = 3000,
        --     command = 'bundle',
        --     -- args = vim.list_extend({ 'exec', 'rubocop' }, null_ls.builtins.formatting.rubocop._opts.args),
        --     args = { 'exec', 'rubocop', '-A', '-f', 'quiet', '--stderr', '--stdin', '$FILENAME' },
        -- }),
        null_ls.builtins.formatting.stylua,
    },
})
