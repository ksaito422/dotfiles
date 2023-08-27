local status, cmp = pcall(require, 'cmp')
if not status then
    return
end

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered({
            -- border = { '●', '─', '●', '│', '●', '─', '●', '│' },
            border = 'single',
            winhighlight = 'Normal:Pmenu'
        }),
        documentation = cmp.config.window.bordered({
            -- border = { '●', '─', '●', '│', '●', '─', '●', '│' },
            border = 'single',
            winhighlight = 'Normal:Pmenu'
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-l>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    }),
    formatting = {
    format = function(entry, vim_item)
      if vim.tbl_contains({ 'path' }, entry.source.name) then
        local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
        if icon then
            vim_item.kind = icon
            vim_item.kind_hl_group = hl_group
            return vim_item
        end
      end
      return require('lspkind').cmp_format({ with_text = true })(entry, vim_item)
    end
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
         -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        { name = 'git' },
    }, {
        { name = 'buffer' },
    }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
        { name = 'cmdline_history' },
    }),
})
