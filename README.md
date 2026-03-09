# dotfiles

This repository in order to management dotfiles.

## using

1. `xcode-select --install`
2. `git clone <url>`
3. Running `init.sh`
4. `gem install rails ruby-lsp rubocop`
5. `npm install -g typescript-language-server`
6. `cargo install selene`

## contents of init.sh setting

- Set of symbolic link.
- Installation of applications managed by brewfile.
- Installing nerdfont.

## checking

core tools are installed correctly.

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

## using tools

- Editor: [Neovim](https://github.com/neovim/neovim)
- Shell: [zsh](https://sourceforge.net/p/zsh/code/ci/master/tree/)
- Terminal: [wezterm](https://wezfurlong.org/wezterm/)
- os package manager: [Homebrew](https://brew.sh/index_ja)
- package manager: [mise](https://github.com/jdx/mise)
