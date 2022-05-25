lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true
  },
  ensure_installed = 'maintained' -- one of "all", "maintained"
}
EOF

