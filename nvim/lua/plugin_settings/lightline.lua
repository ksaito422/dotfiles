vim.cmd([[
	let g:lightline = {
	\ 'colorscheme': 'nightfox',
	\ 'enable': { 'tabline': 2 },
	\ 'active': {
	\ 'left': [ ['mode', 'paste'], ['gitbranch', 'readonly', 'modified'], ['filename'] ],
	\ 'right': [ ['percent'], ['lineinfo'], ['fileencoding', 'filetype'] ] 
	\ },
	\ 'inactive': {
	\ 'left': [ ['filename_path'] ],
	\ 'right': [ ['percent'], ['fileencording'] ]
	\ },
	\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
	\ 'subseparator' :{ 'left': "\ufb2b", 'right': '\ue0b3' },
	\ 'component_function': {
	\ 'gitbranch': 'gina#component#repo#branch',
	\ 'filename_path': 'LightlineFilename'
	\ },
	\ }

	let g:lightline.tabline = {
	\ 'left': [ [ 'filename_path' ] ],
	\ }

	" 現在のディレクトリからのファイルパスを表示
	" 差分がある場合、"+"表現
	function! LightlineFilename()
		let filename = expand('%:.') !=# '' ? expand('%:.') : '[No Name]'
		let modified = &modified ? " +" : ''
		return filename . modified
	endfunction

	" 色の定義
	let s:black = [ '#393b44', 235 ]
	let s:gray = [ '#424242', 236 ]
	let s:white = [ '#a9b7c6', 250 ]
	let s:blue = [ '#719cd6' , 14 ]
	let s:green = [ '#81b29a', 114 ]
	let s:purple = [ '#9d79d6', 104 ]
	let s:red = [ '#ff6b68', 204 ]
	let s:yellow = [ '#ffc66d', 222 ]

	let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
	let s:p.normal.left = [ [ s:black, s:blue ], [ s:blue, s:gray ] ]
	let s:p.normal.right = [ [ s:black, s:blue ], [ s:blue, s:gray ] ]
	let s:p.normal.middle = [ [ s:black, s:blue ] ]
	let s:p.normal.error = [ [ s:red, s:black ] ]
	let s:p.normal.warning = [ [ s:yellow, s:black ] ]
	let s:p.insert.left = [ [ s:black, s:green ], [ s:green, s:gray ] ]
	let s:p.insert.right = [ [ s:black, s:green ], [ s:green, s:gray ] ]
	let s:p.insert.middle = [ [ s:black, s:green ], [ s:green, s:gray ] ]
	let s:p.visual.left = [ [ s:black, s:purple ], [ s:purple, s:gray ] ]
	let s:p.visual.right = [ [ s:black, s:purple ], [ s:purple, s:gray ] ]
	let s:p.visual.middle = [ [ s:black, s:purple ], [ s:purple, s:gray ] ]
	let s:p.inactive.left =  [ [ s:yellow, s:gray ], [ s:blue, s:gray ] ]
	let s:p.inactive.right = [ [ s:yellow, s:gray ], [ s:blue, s:gray ] ]
	let s:p.inactive.middle = [ [ s:black, s:gray ] ]
	let s:p.replace.left = [ [ s:black, s:red ], [ s:red, s:gray ] ]
	let s:p.replace.right = [ [ s:black, s:red ], [ s:red, s:gray ] ]
	let s:p.tabline.left = [ [ s:gray, s:blue ] ]
	let s:p.tabline.tabsel = [ [ s:black, s:blue ] ]
	let s:p.tabline.middle = [ [ s:blue, s:gray ] ]
	let s:p.tabline.right = [ [ s:black, s:blue ] ]

	" nightfoxのパレットを選択 "
	let g:lightline#colorscheme#nightfox#palette = lightline#colorscheme#flatten(s:p)
]])
