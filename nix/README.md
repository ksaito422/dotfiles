## パッケージの追加

`home.nix`に追加して、`flake.nix`が存在するディレクトリで`sudo darwin-rebuild switch --flake .`を実行してください。

## 更新

```
# パッケージ更新
nix flake update nixpkgs

# Home Manager 更新
nix flake update home-manager

# nix-darwin 更新
nix flake update nix-darwin

# 全てを更新
nix flake update

# バージョンの更新
sudo darwin-rebuild switch
```

## brew管理下の更新

```
# formulaの更新
brew update

# バージョンの更新
sudo darwin-rebuild switch

# brewパッケージの追加
sudo darwin-rebuild switch --flake .
```

## 参考
- [ちいさくはじめる Nix](https://zenn.dev/trifolium/books/1c0373f3570334)
- [NixOS Search - Packages](https://search.nixos.org/packages)
