let g:lightline = {
  \ 'colorscheme': 'nightfox',
  \  'enable': { 'tabline': 2 },
  \  'active': {
  \    'left': [ ['mode', 'paste'], ['readonly', 'filename', 'modified'] ],
  \    'right': [ ['percent'], ['lineinfo'], ['fileencoding', 'filetype'] ] 
  \  },
  \  'inactive': {
  \    'left': [ ['filename'] ],
  \    'right': [ ['percent'], ['fileencording'] ]
  \  },
  \  'separator': { 'left': "\ue0c0", 'right': "\ue0c3" },
  \  'subseparator' :{ 'left': "\uf6f6", 'right': '\ue2a2' },
  \ }

