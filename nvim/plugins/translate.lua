vim.cmd([[
	"翻訳元言語
	let g:translate_source = "en"
	"翻訳先言語
	let g:translate_target = "ja"
	"ポップアップウインドウを閉じる。使うときは1を指定する。
	" let g:translate_popup_window = 0
	"翻訳結果ウインドウのサイズ
	let g:translate_winsize = 10
]])

vim.api.nvim_set_keymap('n', 'tt', ':Translate<CR>', {})
vim.api.nvim_set_keymap('n', 't', ':VTranslate<CR>', {})
