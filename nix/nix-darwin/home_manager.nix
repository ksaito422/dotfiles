{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users."saito" = ../home-manager/home.nix;
  home-manager.users."saito-work" = ../home-manager/home.nix;
}
