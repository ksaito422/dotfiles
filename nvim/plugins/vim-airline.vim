"status lineの表示内容
let g:airline#extensions#default#layout = [
  \ [ 'a', 'c' ],
  \ ['y', 'z'],
  \ ]
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'

