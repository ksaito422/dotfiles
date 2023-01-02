local keymap = vim.api.nvim_set_keymap

keymap('n', 'ss', '<cmd>SSave!<CR>', { noremap = true, silent = true })
keymap('n', 'sd', '<cmd>SDelete!<CR>', { noremap = true, silent = true })

vim.cmd([[
	let g:ascii = [
	\ "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
	\ "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
	\ "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
	\ "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
	\ "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
	\ "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
	\]
	let g:startify_custom_header = g:ascii

	let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
	\ ]
	let g:startify_files_number = 10

	" Sessions
	let g:startify_session_number = 20
	let g:startify_session_persistence = 1
]])


