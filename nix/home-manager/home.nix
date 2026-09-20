{ pkgs, ... }:

{
  # home.username / home.homeDirectory は設定しない。
  # nix-darwin の users.users.<name>.home から自動導出されるため、
  # このファイルを saito / fukugyou で共有できる。
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    bat
    btop
    colima
    delta
    deno
    docker
    docker-compose
    efm-langserver
    eza
    fzf
    gh
    ghq
    git
    jq
    lazydocker
    lazygit
    lima
    lua-language-server
    nb
    neovim
    neovim-remote
    ripgrep
    selene
    stylua
    terraform-ls
    tflint
    typos
    yazi
  ];

  programs.home-manager.enable = true;
}
