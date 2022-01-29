let g:lightline = {
  \ 'colorscheme': 'nightfox',
  \  'enable': { 'tabline': 0 },
  \  'active': {
  \    'left': [ ['mode', 'paste'], ['readonly', 'filename', 'modified'] ],
  \    'right': [ ['percent'], ['lineinfo'], ['fileencoding', 'filetype'] ] 
  \  },
  \  'inactive': {
  \    'left': [ ['filename'] ],
  \    'right': [ ['percent'], ['fileencording'] ]
  \  },
  \  'separator': { 'left': "\u2b80", 'right': "\u2b82" },
  \  'subseparator' :{ 'left': "\u2b81", 'right': '\u2b83' },
  \ }

