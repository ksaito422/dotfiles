# -e・・・エラーが処理を中断
# -u・・・未定義の変数を使おうとすると処理中断
#!/bin/bash -eu
path=~/dotfiles

cd ~/

# AMD Mac以外ならセットアップ終了
if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# ディレクトリが存在しない場合は作成する
if [ ! -e ~/.config ]; then
  mkdir -p ~/.config
fi


# ~/dotfilesに戻る
cd $path

if [ $path ]; then
  ln -s $PWD/.zshrc ~/.zshrc

  # nvim
  ln -s $PWD/dotfiles/nvim ~/.config/nvim
  # kitty
  ln -s $PWD/dotfiles/kitty ~/.config/kitty
  # wezterm
  ln -s $PWD/dotfiles/wezterm ~/.config/wezterm
  # git
  ln -s $PWD/dotfiles/git ~/.config/git
fi

# brew install
brew bundle --global

# nerdfontのインストールする
git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
cd ..
$ rm -fr nerd-fonts

# DAP for golangのインストール
go install github.com/go-delve/delve/cmd/dlv@latest
