# はじめに

NeoVim 設定ファイルのリポジトリ

※Editor の設定のみのため clone して適宜設定をいじる必要があります。

### 環境構築

```
// install
brew install neovim
nvim -version
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim

// plugin manager
brew install python3
pip3 install -U neovim
mkdir ~/.vim/dein
touch ~/.config/nvim/dein.toml
touch ~/.config/nvim/lazy.toml
cd ~/.vim/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
```

https://blog.htkyama.org/vim_airline を参考に PowerLine Fonts と Nerd Fonts をインストールする

使用している Font は`FuraMono Nerd Font`
