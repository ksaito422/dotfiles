local ddc = {
  global = vim.fn["ddc#custom#patch_global"],
}

ddc.global({
  ui = "pum",
  sources = {
    "nvim-lsp",
    "around",
    "path",
  },
  sourceOptions = {
    ["_"] = {
      matchers = { "matcher_fuzzy" },
      sorters = { "sorter_fuzzy" },
      converters = { "converter_fuzzy" },
    },
    ["around"] = {
      mark = "[Around]",
    },
    ["nvim-lsp"] = {
      mark = "[LSP]",
      forceCompletionPattern = "\\.\\w*|:\\w*|->\\w*",
    },
    ["path"] = {
      mark = "[PATH]",
    },
  },
  sourceParams = {
    ["around"] = {
      maxSize = 500,
    },
    ["nvim-lsp"] = {
      kindLabels = {
        Text = " ",
        Method = " ",
        Function = " ",
        Constructor = " ",
        Field = "ﰠ ",
        Variable = " ",
        Class = " ",
        Interface = " ",
        Module = " ",
        Property = " ",
        Unit = " ",
        Value = " ",
        Enum = " ",
        Keyword = " ",
        Snippet = "﬌ ",
        Color = " ",
        File = " ",
        Reference = " ",
        Folder = " ",
        EnumMember = " ",
        Constant = " ",
        Struct = " ",
        Event = " ",
        Operator = "ﬦ ",
        TypeParameter = " ",
      },
    },
    ["path"] = {
      cmd = {
        "find",
        "--max-depth",
        "5",
      },
    },
  },
})

vim.cmd([[
    " pum key mappings
    " <TAB>: completion
    inoremap <silent><expr> <TAB>
        \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
        \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
        \ '<TAB>' : ddc#manual_complete()
    inoremap <silent><expr> <S-TAB>
        \ pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' :
        \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
        \ '<S-TAB>' : ddc#manual_complete()
    inoremap <C-y> <Cmd>call pum#map#confirm()<CR>
    inoremap <C-e> <Cmd>call pum#map#cancel()<CR>

    autocmd CompleteDone * silent! pclose!

    call ddc#enable()
    call signature_help#enable()
    call popup_preview#enable()

    " コードのドキュメンテーション(floating window)のボーダー有無
    let g:popup_preview_config = {
        \   'border': v:true,
        \ }
]])
