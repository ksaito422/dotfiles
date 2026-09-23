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

# miseのインストール
curl -fsSL https://mise.run | sh

# claude codeのインストール
curl -fsSL https://claude.ai/install.sh | bash

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
  # karabiner
  ln -s $path/karabiner/karabiner $HOME/.config/karabiner/karabiner.json
  # claude code
  ln -s $path/.claude/skills $HOME/.claude/skills
  ln -s $path/.claude/agents $HOME/.claude/agents
  ln -s $path/.claude/settings.json $HOME/.claude/settings.json
fi

# nerdfontのインストール
cd ~/
git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh install Hack
cd ..
rm -rf nerd-fonts

