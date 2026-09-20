{ self, ... }:

{
  system.primaryUser = "saito";
  users.users."saito".home = "/Users/saito";
  users.users."saito-work".home = "/Users/saito-work";

  imports = [
    ./home_manager.nix
    ./homebrew.nix
    ./system.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  nix.enable = false;
}
