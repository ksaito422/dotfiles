local g = vim.g

-- 現在のディレクトリがGitリポジトリでない場合、balmerは自動的に無効になる
g.blamer_enabled = 1 -- git blameの有効無効設定
g.blamer_delay = 1000 -- メッセージ表示までの遅延時間(ms)
g.blamer_show_in_visual_modes = 0 -- ビジュアルモードで表示
g.blamer_show_in_insert_modes = 0 -- インサートモードで表示
g.blamer_prefix = ' @ ' -- テンプレートに追加されるプレフィクス
g.blamer_date_format = '%y/%m/%d %H:%M' -- 時間表示のフォーマット

vim.cmd 'autocmd ColorScheme * highlight Blamer ctermbg=none guibg=none' -- 背景色
