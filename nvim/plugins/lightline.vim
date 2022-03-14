let g:lightline = {
  \ 'colorscheme': 'nightfox',
  \  'enable': { 'tabline': 2 },
  \  'active': {
  \    'left': [ ['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified'] ],
  \    'right': [ ['percent'], ['lineinfo'], ['fileencoding', 'filetype'] ] 
  \  },
  \  'inactive': {
  \    'left': [ ['filename'] ],
  \    'right': [ ['percent'], ['fileencording'] ]
  \  },
  \  'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \  'subseparator' :{ 'left': "\ufb2b", 'right': '\ue0b3' },
  \  'component_function': {
  \    'gitbranch': 'gina#component#repo#branch'
  \   },
  \ }

