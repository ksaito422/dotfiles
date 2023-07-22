# -e・・・エラーが処理を中断
# -u・・・未定義の変数を使おうとすると処理中断
#!/bin/bash -eu
path=$HOME/dotfiles

cd ~/

# AMD Mac以外ならセットアップ終了
if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# ディレクトリが存在しない場合は作成する
if [ ! -e ~/.config ]; then
  mkdir -p $HOME/.config
fi


# ~/dotfilesに戻る
cd $path

if [ $path ]; then
  ln -s $PWD/.zshrc $HOME/.zshrc

  # nvim
  ln -s $PWD/nvim $HOME/.config/nvim
  # wezterm
  ln -s $PWD/wezterm $HOME/.config/wezterm
  # git
  ln -s $PWD/git $HOME/.config/git
  # lazygit
  ln -s $PWD/lazygit $HOME/.config/lazygit
  # solargraph
  ln -s $PWD/solargraph $HOME/.config/solargraph
fi

# brew install
brew bundle --global

# volta
curl https://get.volta.sh | bash

# nerdfontのインストールする
git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
cd ..
$ rm -fr nerd-fonts

# DAP for golangのインストール
go install github.com/go-delve/delve/cmd/dlv@latest
