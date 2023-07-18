vim.cmd([[
    " ddc + lsp
    call ddc#custom#patch_global('ui', 'native')
    call ddc#custom#patch_global('sources', ['nvim-lsp', 'around', 'path'])
    call ddc#custom#patch_global('sourceOptions', {
        \   '_': {
        \       'matchers': ['matcher_fuzzy'],
        \       'sorters': ['sorter_fuzzy'],
        \       'converters': ['converter_fuzzy'],
        \   },
        \   'around': {'mark': '[Around]'},
        \   'nvim-lsp': {
        \       'mark': '[LSP]',
        \       'forceCompletionPattern': '\.\w*|:\w*|->\w*',
        \   },
        \   'path': {'mark': 'P'},
        \ })

	call ddc#custom#patch_global('sourceParams', {
        \   'around': {'maxSize': 500},
        \ })

	call ddc#custom#patch_global('sourceParams', {
        \   'nvim-lsp': { 'kindLabels': { 'Class': 'c' } },
        \   'path': {
        \       'cmd': ['find', '--max-depth', '5'],
        \   }
        \ })

    " <TAB>: completion
    inoremap <silent><expr> <TAB>
        \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
        \ '<TAB>' : ddc#manual_complete()
    inoremap <expr><S-TAB>  pum#visible() ? '<C-p>' : '<C-h>'

    autocmd CompleteDone * silent! pclose!

    call ddc#enable()
    call signature_help#enable()
    call popup_preview#enable()

    " コードのドキュメンテーション(floating window)のボーダー有無
    let g:popup_preview_config = {
        \   'border': v:true,
        \ }
]])
