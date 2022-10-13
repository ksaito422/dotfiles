let g:ale_fixers = {
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'css': ['prettier'],
\   'go': ['gofmt'],
\   'markdown': ['prettier'],
\   'php': ['php_cs_fixer'],
\}

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_statusline_format = ['E%d', 'W%d', 'OK']

let g:ale_fix_on_save = 1
let g:ale_php_php_cs_fixer_executable = '/usr/local/bin/php-cs-fixer'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_typescript_prettier_use_local_config = 1
let g:ale_javascript_prettier_options = '--printWidth 100 --tabWidth 2 --single-quote --jsxSingleQuote true --trailing-comma es5 --bracketSpacing true --jsxBracketSameLine --semi true --errorParens avoid --endOfLine crlf'
let g:ale_typescript_prettier_options = '--printWidth 100 --tabWidth 2 --single-quote --jsxSingleQuote true --trailing-comma es5 --bracketSpacing true --jsxBracketSameLine --semi true --errorParens avoid --endOfLine crlf'
'
