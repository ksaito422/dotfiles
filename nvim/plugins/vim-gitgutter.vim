let g:gitgutter_map_keys = 0
nmap g] <Plug>(GitGutterNextHunk)
nmap g[ <Plug>(GitGutterNextHunk)
nmap gh <Plug>(GitGutterLineHighlightsToggle)
nmap gp <Plug>(GitGutterPreviewHunk)

highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red

set updatetime=250

