{ pkgs, ... }:

{
  home.username = "saito";
  home.homeDirectory = "/Users/saito";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    bat
    btop
    chafa
    cmake
    colima
    delta
    deno
    docker-compose
    efm-langserver
    eza
    fzf
    gawk
    gh
    ghq
    git
    gnugrep
    grpcurl
    hivemind
    imagemagick
    jq
    lazydocker
    lazygit
    lima
    lua-language-server
    luarocks
    mise
    nb
    neovim
    neovim-remote
    nkf
    prettierd
    pstree
    qemu
    ripgrep
    selene
    stylua
    superfile
    terraform-ls
    tflint
    tree
    tree-sitter
    typos
    typos-lsp
    yazi
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  programs.home-manager.enable = true;
}
