-- 現在のディレクトリがGitリポジトリでない場合、balmerは自動的に無効になる
vim.g.blamer_enabled = 1 -- git blameの有効無効設定
vim.g.blamer_delay = 1000 -- メッセージ表示までの遅延時間(ms)
vim.g.blamer_show_in_visual_modes = 0 -- ビジュアルモードで表示
vim.g.blamer_show_in_insert_modes = 0 -- インサートモードで表示
vim.g.blamer_prefix = '' -- テンプレートに追加されるプレフィクス
vim.g.blamer_date_format = '%y/%m/%d %H:%M' -- 時間表示のフォーマット
vim.cmd 'autocmd ColorScheme * highlight Blamer ctermbg=none guibg=none' -- 背景色
