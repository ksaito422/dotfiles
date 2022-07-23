nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implemntation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<CR>
nmap <leader>do <Plug>(coc-codeaction)

let g:coc_global_extensions = [
      \'coc-json',
      \'coc-css',
      \'coc-eslint',
      \'coc-prettier',
      \'coc-tsserver',
      \'coc-toml',
      \'coc-yaml',
      \'coc-phpls',
      \'coc-php-cs-fixer',
      \'coc-fzf-preview',
      \'coc-pairs',
      \'coc-go'
      \]

"coc-fzf-previewのデフォルトキーマップ
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

"配下のファイル・ディレクトリ全てを表示
nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
"Git statusを表示
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
"Git操作を表示
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
"開いているバッファリストを表示(現在のページとディレクトリは除く)
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
"全ての開いているバッファを表示
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
"配下のファイル・ディレクトリを表示
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

"install gopls GoのLSP
nnoremap <silent> <Leader>g    :<C-u>CocCommand go.install.gopls<CR>

"pritterによる自動整形
command! -nargs=0 Format :call CocAction('format')

if !exists('g:vscode')
  function! ShowDocIfNoDiagnostic(timer_id)
    if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
      silent call CocActionAsync('doHover')
    endif
  endfunction

  function! s:show_hover_doc()
    call timer_start(100, 'ShowDocIfNoDiagnostic')
  endfunction

  autocmd CursorHoldI * :call <SID>show_hover_doc()
  autocmd CursorHold * :call <SID>show_hover_doc()
endif
