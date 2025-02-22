local status, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

nvim_treesitter_configs.setup({
  -- ensure_installed = "all", -- one of "all", "maintained"
  ensure_installed = {
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
    "jsonc",
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
  }, -- one of "all", "maintained"
  -- ignore_install = { "haskell", "phpdoc" },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
  },
})
