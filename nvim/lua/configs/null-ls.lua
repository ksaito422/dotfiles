local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

null_ls.setup({
    sources = {
        -- js,ts,jsx,tsx
        -- ローカルおよびグローバルのeslintのコード診断機能を利用する
        null_ls.builtins.diagnostics.eslint.with({
            prefer_local = 'node_modules/.bin' -- プロジェクトローカルがある場合はそれを利用
        }),
        -- ローカルおよびグローバルのPrettierをFormatに利用する
        null_ls.builtins.formatting.prettier.with({
            prefer_local = 'node_modules/.bin' -- プロジェクトローカルがある場合はそれを利用
        }),
        -- NOTE: bundle exec rubocopを実行しないため、ale.vimでrubocopを使用する
        -- ruby
        -- null_ls.builtins.diagnostics.rubocop,
        -- null_ls.builtins.formatting.rubocop.with({
        --     timeout_ms = 3000,
        -- }),
    }
})
