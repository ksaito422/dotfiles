{ pkgs, ... }:

{
  home.username = "saito";
  home.homeDirectory = "/Users/saito";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    bat
    btop
    colima
    delta
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
