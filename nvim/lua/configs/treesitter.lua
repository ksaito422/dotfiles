local parsers_to_install = {
  "bash",
  "c",
  "comment",
  "cpp",
  "css",
  "diff",
  "dockerfile",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "go",
  "gomod",
  "gosum",
  "graphql",
  "hcl",
  "html",
  "http",
  "ini",
  "javascript",
  "jq",
  "jsdoc",
  "json",
  "json5",
  "lua",
  "make",
  "markdown",
  "markdown_inline",
  "mermaid",
  "ruby",
  "scss",
  "sql",
  "terraform",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

-- treesitter ハイライトを FileType イベントで自動有効化
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- -- このモジュールが FileType より後に読み込まれた場合のフォールバック
-- vim.schedule(function()
--   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--     if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype ~= "" then
--       pcall(vim.treesitter.start, buf)
--     end
--   end
-- end)

-- treesitter インデントを有効化
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "" then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- 未インストールのパーサーを VimEnter 時に自動インストール
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    local config = require("nvim-treesitter.config")
    local install = require("nvim-treesitter.install")
    local installed = config.get_installed()
    local to_install = vim.tbl_filter(
      function(p) return not vim.list_contains(installed, p) end,
      parsers_to_install
    )
    if #to_install > 0 then
      install.install(to_install)
    end
  end,
})
