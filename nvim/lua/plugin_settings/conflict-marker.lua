vim.cmd([[
	" Default values
	let g:conflict_marker_begin = '^<<<<<<< .*$'
	let g:conflict_marker_common_ancestors = '^||||||| .*$'
	let g:conflict_marker_separator = '^=======$'
	let g:conflict_marker_end   = '^>>>>>>> .*$'

	" disable the default highlight group
	let g:conflict_marker_highlight_group = ''
]])

vim.cmd 'highlight ConflictMarkerBegin guibg=#2f7366'
vim.cmd 'highlight ConflictMarkerOurs guibg=#2e5049'
vim.cmd 'highlight ConflictMarkerTheirs guibg=#344f69'
vim.cmd 'highlight ConflictMarkerEnd guibg=#2f628e'
vim.cmd 'highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81'
