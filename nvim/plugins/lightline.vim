let g:lightline = {
  \ 'colorscheme': 'nightfox',
  \  'enable': { 'tabline': 2 },
  \  'active': {
  \    'left': [ ['mode', 'paste'], ['gitbranch', 'readonly', 'modified'], [ 'filename' ] ],
  \    'right': [ ['percent'], ['lineinfo'], ['fileencoding', 'filetype'] ] 
  \  },
  \  'inactive': {
  \    'left': [ ['filename'] ],
  \    'right': [ ['percent'], ['fileencording'] ]
  \  },
  \  'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \  'subseparator' :{ 'left': "\ufb2b", 'right': '\ue0b3' },
  \  'component_function': {
  \    'gitbranch': 'gina#component#repo#branch',
  \    'filename': 'LightlineFilename'
  \   },
  \ }

" 現在のディレクトリからのファイルパスを表示
" 差分がある場合、"+"表現
function! LightlineFilename()
	let filename = expand('%:.') !=# '' ? expand('%:.') : '[No Name]'
	let modified = &modified ? " +" : ''
	return filename . modified
endfunction

