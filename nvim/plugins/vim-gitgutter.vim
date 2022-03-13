let g:gitgutter_map_keys = 0
nmap g] <Plug>(GitGutterNextHunk)
nmap g[ <Plug>(GitGutterNextHunk)
nmap gh <Plug>(GitGutterLineHighlightsToggle)
nmap gp <Plug>(GitGutterPreviewHunk)
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterRevertHunk
nmap <Leader>gv <Plug>GitGutterPreviewHunk

highlight GitGutterAdd guifg=lightgreen
highlight GitGutterChange guifg=yellow
highlight GitGutterDelete guifg=red

set updatetime=250

