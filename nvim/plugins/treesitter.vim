lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true
  },
  ensure_installed = 'all' -- one of "all", "maintained"
}
EOF

