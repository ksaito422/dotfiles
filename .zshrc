# 変更後、即反映コマンド
# source ~/.zshrc

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=/usr/local/opt/python@3.7/libexec/bin:$PATH
export PATH=/usr/local/opt/gawk/bin/:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Dockerイメージを「なりすまし」と「改ざん」から保護するセキュリティ機能
export DOCKER_CONTENT_TRUST=1

# Gitで開くEditorをNeoVimに設定
export EDITOR='nvim'
export VISUAL='nvim'

# direnvの利用設定
eval "$(direnv hook zsh)"

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
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# シェルスクリプト置き場のパスを追加
PATH=$PATH:~/bin

# alias
### ls
alias lalias='alias | grep "ls"'
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'

### cd
alias cdalias='alias | grep "cd"'
alias cdw='cd ~/work/'
alias cdp='cd ~/work/project'

### docker
alias dockeralias='alias | grep "docker"'
alias dcupd='docker compose up -d'
alias dcps='docker compose ps'
alias dcla='docker container ls -a'
alias dex='docker exec -it'
alias dcs='docker compose stop'
alias dcd='docker compose down'
alias ds='docker stop'

### git
alias gitalias='alias | grep "git"'
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
if [ -f '/Users/saito/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/saito/google-cloud-sdk/completion.zsh.inc'; fi
