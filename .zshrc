# 変更後、即反映コマンド
# source ~/.zshrc

export PATH=/usr/local/opt/python@3.8/libexec/bin:$PATH
export PATH=/usr/local/opt/gawk/bin/:$PATH
export LANG="ja_JP.UTF-8"
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin
export PATH=/usr/local/opt/mysql-client/bin:$PATH
export PRETTIERD_DEFAULT_CONFIG=$HOME/dotfiles/.prettierrc
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.cargo/bin:$PATH"

# Dockerイメージを「なりすまし」と「改ざん」から保護するセキュリティ機能
export DOCKER_CONTENT_TRUST=0

# Rubyのバージョン管理ツール
eval "$(rbenv init - zsh)"

# cd [tab]で以前移動したディレクトリを表示
setopt auto_pushd
# 直前と同じコマンドはヒストリに追加しない
setopt hist_ignore_dups
# スペースから始まるコマンドはヒストリに残さない
setopt hist_ignore_space
# [tab][tab]でパス名補完候補から選択できるようにする
zstyle ':completion:*:default' menu select=1
# コマンドのスペルを訂正する
setopt correct
# vim mode
# bindkey -v

# PROMPTの表示内容をカスタマイズ
### gitブランチを表示
### 色を使用できるようにする
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u%b%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
### PROMPT左側に表示
function left-prompt {
  name_t='204;153;51'      # user name text color
  name_b='0;0;0'    # user name background color
  path_t='255;255;255'     # path text color
  path_b='0;102;153'   # path background color
  git_b='0;0;0'    # user name background color
  arrow='0;0;0'   # arrow color
  text_color='%{\e[38;2;'    # set text color
  back_color='%{\e[48;2;' # set background color
  reset='%{\e[0m%}'   # reset
  sharp='\uE0B0'      # trianglei

  user="${back_color}${name_b}m%}${text_color}${name_t}m%}%n${reset}"
  dir="${back_color}${path_b}m%}${text_color}${path_t}m%}%~${reset}"
  git="${back_color}${name_b}m%}${text_color}${name_t}m%}\$vcs_info_msg_0_${reset}"
  # format: user name > current dir > git status > now
  echo "${user}${back_color}${path_b}m%}${text_color}${name_b}m%}${sharp}"\
    "${dir}${text_color}${path_b}m%}${back_color}${git_b}m%}${sharp}"\
    "${git}${text_color}${git_b}m%}${sharp}${reset}"\
    "%D{%Y/%m/%d} %*"\
    "\n%F{004}>>> "
}
PROMPT=`left-prompt`
precmd(){ vcs_info }

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

if type brew &>/dev/null
then
  # brewがインストールされている場合
  # brewのzsh-completionsを読み込む
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  # コマンド入力時に直近の履歴を表示
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# シンタックスハイライト brew install zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# シェルスクリプト置き場のパスを追加
PATH=$PATH:~/bin

# alias
### clear
alias cc='clear'
### ls
# alias lalias='alias | grep "ls"'
# alias la='ls -a'
# alias ll='ls -l'
# alias lal='ls -al'

### cd
alias cd-alias='alias | grep "cd"'
alias cdw='cd ~/work/'
alias cdp='cd ~/work/project'

### eza
alias eza-alias='alias | grep "eza"'
alias ls='eza -1lF'
alias la='eza -1aalF'
alias lt='eza -T -L 3 -a --icons -I "node_modules|.git|.cache"'

### bat
alias bat-alias='alias | grep "bat"'
alias cat='bat'
alias cata='bat -A'

### procs
alias procs-alias='alias | grep "procs"'
alias ps='procs'
alias pscpu='ps --sortd cpu'

### docker
alias docker-alias='alias | grep "docker"'
alias dcup='docker compose up'
alias dcupd='docker compose up -d'
alias dcps='docker compose ps'
alias dcla='docker container ls -a'
alias dex='docker exec -it'
alias dcs='docker compose stop'
alias dcd='docker compose down'
alias dcb='docker compose build'
alias ds='docker stop'
alias dcl='docker compose logs'
alias dnl='docker network ls'
alias di='docker images'
alias dri='docker rmi'

### git
alias git-alias='alias | grep "git"'
alias ginit='git init'
alias gadd='git add'
alias gadda='git add -A'
alias gaddu='git add -U'
alias gco='git commit'
alias gpush='git push'
alias gpull='git pull'
alias gf='git fetch'
alias gm='git merge'
alias gstatus='git status'
alias glog='git log --oneline'
alias glog10='git log --oneline -10 --graph --decorate'
alias gdiffh='git diff HEAD'
alias gb='git branch'
alias gswitch='git switch'
alias grestore='git restore'
alias gcherry='git cherry-pick'
alias gstash='git stash'
alias gstashu='git stash -u'
alias gstashs='git stash save'
alias gstashl='git stash list'
alias gstashp='git stash pop'
alias gstashc='git stash clear'
alias greset='git reset'
alias greseth='git reset --hard'
alias gresets='git reset --soft'
alias gremote= 'git remote'
alias diff='git diff'

### vim
# alias v='nvim'
# alias vi='nvim'
# alias vim='nvim'
# nvim-remoteでlazygitからnvimを開くための設定
alias vim='nvim --listen /tmp/nvim-server.pipe'
alias v='vim'
alias vi='vim'
alias nvimconf='vi ~/.config/nvim .'
export PATH=$PATH:~/.bin

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    alias nvim=nvr --remote-wait +'set bufhidden=wipe'
fi

# Gitで開くEditorをNeoVimに設定
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi

# pecoでヒストリ検索
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/saito/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/saito/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/saito/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/saito/google-cloud-sdk/completion.zsh.inc'; fi
