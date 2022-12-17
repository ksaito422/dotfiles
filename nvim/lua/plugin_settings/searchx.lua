local keymap = vim.api.nvim_set_keymap

-- Overwrite / and ?.
keymap('n', '?', '<Cmd>call searchx#start({ "dir": 0 })<CR>', { noremap = true })
keymap('n', '/', '<Cmd>call searchx#start({ "dir": 1 })<CR>', { noremap = true })
keymap('x', '?', '<Cmd>call searchx#start({ "dir": 0 })<CR>', { noremap = true })
keymap('x', '/', '<Cmd>call searchx#start({ "dir": 1 })<CR>', { noremap = true })
keymap('c', ';', '<Cmd>call searchx#select()<CR>', { noremap = true })

-- Move to next/prev match.
keymap('n', 'N', '<Cmd>call searchx#prev_dir()<CR>', { noremap = true })
keymap('n', 'n', '<Cmd>call searchx#next_dir()<CR>', { noremap = true })
keymap('x', 'N', '<Cmd>call searchx#prev_dir()<CR>', { noremap = true })
keymap('x', 'n', '<Cmd>call searchx#next_dir()<CR>', { noremap = true })

-- Clear highlights
keymap('n', '<C-l>', '<Cmd>call searchx#clear()<CR>', { noremap = true })

vim.cmd([[
	let g:searchx = {}

	" Auto jump if the recent input matches to any marker.
	let g:searchx.auto_accept = v:true

	" The scrolloff value for moving to next/prev.
	let g:searchx.scrolloff = &scrolloff

	" To enable scrolling animation.
	let g:searchx.scrolltime = 500

	" To enable auto nohlsearch after cursor is moved
	let g:searchx.nohlsearch = {}
	let g:searchx.nohlsearch.jump = v:true

	" Marker characters.
	let g:searchx.markers = split('ABCDEFGHIJKLMNOPQRSTUVWXYZ', '.\zs')

	" Convert search pattern.
	function g:searchx.convert(input) abort
		if a:input !~# '\k'
			return '\V' .. a:input
		endif
		return a:input[0] .. substitute(a:input[1:], '\\\@<! ', '.\\{-}', 'g')
	endfunction
]])
