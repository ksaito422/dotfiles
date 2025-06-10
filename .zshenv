#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
export PATH=~/.composer/vendor/bin:/usr/local/opt/php@7.4/bin:/Users/saito/.nodebrew/current/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin
. "$HOME/.cargo/env"

export PATH=/usr/local/opt/python@3.8/libexec/bin:$PATH
export PATH=/usr/local/opt/gawk/bin/:$PATH
export LANG="ja_JP.UTF-8"
export GOBIN="$HOME/go/bin"
export PATH=$PATH:$GOBIN
export PATH=/usr/local/opt/mysql-client/bin:$PATH
export PRETTIERD_DEFAULT_CONFIG=$HOME/dotfiles/.prettierrc
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin":$PATH
export PATH=~/.npm-global/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.cargo/bin:$PATH"

# Additional PATH entries
export PATH=$PATH:~/bin
export PATH=$PATH:~/.bin

# Docker security settings
export DOCKER_CONTENT_TRUST=0

# Editor settings
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi
