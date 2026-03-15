# -e・・・エラーが処理を中断
# -u・・・未定義の変数を使おうとすると処理中断
#!/bin/bash -eu
path=$HOME/work/ghq/github.com/ksaito422/dotfiles

cd ~/

# arm Mac以外ならセットアップ終了
if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# ディレクトリが存在しない場合は作成する
if [ ! -e ~/.config ]; then
  mkdir -p $HOME/.config
fi

# dotfilesに戻る
cd $path

if [ $path ]; then
  ln -s $path/.zshrc $HOME/.zshrc
  ln -s $path/.zshenv $HOME/.zshenv

  # nvim
  ln -s $path/nvim $HOME/.config/nvim
  # wezterm
  ln -s $path/wezterm $HOME/.config/wezterm
  # git
  ln -s $path/git $HOME/.config/git
  # lazygit
  ln -s $path/lazygit $HOME/.config/lazygit
  # mise
  ln -s $path/mise $HOME/.config/mise
  # yazi
  ln -s $path/yazi $HOME/.config/yazi
fi

# brew install
cd $path/brew
brew bundle --global

# nerdfontのインストール
git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
cd ..
$ rm -rf nerd-fonts

