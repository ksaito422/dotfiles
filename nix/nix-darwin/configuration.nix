{ self, ... }:

{
  users.users."saito".home = "/Users/saito";

  imports = [
    ./home_manager.nix
    ./homebrew.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  nix.enable = false;
  security.pam.services.sudo_local.touchIdAuth = true;
}
