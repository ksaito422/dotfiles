" ddc + lsp
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', ['nvim-lsp', 'around'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_fuzzy'],
      \   'sorters': ['sorter_fuzzy'],
      \   'converters': ['converter_fuzzy'],
      \ },
      \ 'around': {'mark': 'A'},
      \ 'nvim-lsp': {
      \   'mark': 'L',
      \   'forceCompletionPattern': '\.\w*|:\w*|->\w*',
      \   },
      \ })

call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

call ddc#custom#patch_global('sourceParams', {
      \ 'nvim-lsp': { 'kindLabels': { 'Class': 'c' } },
      \ })


" <TAB>: completion
inoremap <silent><expr> <TAB>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#manual_complete()
inoremap <expr><S-TAB>  pum#visible() ? '<C-p>' : '<C-h>'

" pum key mappings
inoremap <C-y> <Cmd>call pum#map#confirm()<CR>
inoremap <C-e> <Cmd>call pum#map#cancel()<CR>

autocmd CompleteDone * silent! pclose!

call ddc#enable()

