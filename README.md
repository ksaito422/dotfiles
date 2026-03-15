# dotfiles

dotfiles管理のリポジトリ

## 前提

```
xcode-select --install
git clone <url>
```

## セットアップ

```
chmod 755 init.sh
gem install rails ruby-lsp rubocop
npm install -g typescript-language-server
npm install -g @github/copilot-language-server
cargo install selene
```

## 確認

```
# ruby, node, nvimなどのバージョンを確認
mise list
ruby-lsp --version
rubocop --version
typescript-language-server -V
deno --version
cargo --version
selene --version
colima --version
docker --version
docker-compose --version
nb --version
```

## 使用しているツール

- Editor: [Neovim](https://github.com/neovim/neovim)
- Shell: [zsh](https://sourceforge.net/p/zsh/code/ci/master/tree/)
- Terminal: [wezterm](https://wezfurlong.org/wezterm/)
- os package manager: [Homebrew](https://brew.sh/index_ja)
- package manager: [mise](https://github.com/jdx/mise)
