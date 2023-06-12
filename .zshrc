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

# Dockerイメージを「なりすまし」と「改ざん」から保護するセキュリティ機能
export DOCKER_CONTENT_TRUST=0

# Gitで開くEditorをNeoVimに設定
export EDITOR='nvim'
export VISUAL='nvim'

# direnvの利用設定
eval "$(direnv hook zsh)"

# Rubyのバージョン管理ツール
eval "$(rbenv init - zsh)"

# github cliの補完
eval "$(gh completion -s zsh)"

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
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
### PROMPT左側に表示
function left-prompt {
  name_t='179m%}'      # user name text color
  name_b='000m%}'    # user name background color
  path_t='255m%}'     # path text color
  path_b='031m%}'   # path background color
  arrow='004m%}'   # arrow color
  text_color='%{\e[38;5;'    # set text color
  back_color='%{\e[30;48;5;' # set background color
  reset='%{\e[0m%}'   # reset
  sharp='\uE0B0'      # trianglei
  
  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
  git=\$vcs_info_msg_0_
  echo "${user}%n${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp} ${git}\n${text_color}${arrow}${reset}%F{004}>>>%f "
}
PROMPT=`left-prompt`
precmd(){ vcs_info }
### PROMPT右側に時間表示
RPROMPT='%*'

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# コマンド入力時に直近の履歴を表示
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

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

### exa
alias exa-alias='alias | grep "exa"'
alias ls='exa -1lF'
alias la='exa -1aalF'
alias lst='exa -lT'

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
alias gcom='git commit'
alias gcoma='git commit --amend'
alias gpush='git push'
alias gpull='git pull'
alias gf='git fetch'
alias gm='git merge'
alias gstatus='git status'
alias glog='git log --oneline'
alias glog10='git log --oneline -10 --graph --decorate'
alias gdiffh='git diff HEAD'
alias gb='git branch'
alias gbd='git branch -d'
alias gch='git checkout'
alias gcherry='git cherry-pick'
alias gstash='git stash'
alias gstashu='git stash -u'
alias gstashs='git stash save'
alias gstashl='git stash list'
alias gstashp='git stash pop'
alias gstashc='git stash clear'
alias greset='git reset'
alias greseth='git reset --hard'
alias gresets='git reset --soft HEAD'
alias gremote= 'git remote'

### vim
alias vi='nvim'
alias vim='nvim'
alias nvimconf='vi ~/.config/nvim .'
export PATH=$PATH:~/.bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/saito/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/saito/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/saito/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/saito/google-cloud-sdk/completion.zsh.inc'; fi

# fzf ファジーファインダー
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--color=bg+:24 --height 50% --layout=reverse --border --inline-info --preview 'head -100 {}'"

# fvimコマンドで選択したファイルをvimで開く
fvim() {
  files=$(git ls-files) &&
  # dir=$(find ${1:-.} -path '*/\.*' -prune \
  #                 -o -type d -print 2> /dev/null | fzf +m) &&
  selected_files=$(echo "$files" | fzf -m --preview 'head -100 {}') &&
  vim $selected_files
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch (including remote branches)
fbrm() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
