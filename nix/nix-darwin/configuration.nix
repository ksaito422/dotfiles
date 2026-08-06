{ self, ... }:

{
  system.primaryUser = "saito";
  users.users."saito".home = "/Users/saito";

  imports = [ ./home_manager.nix ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  nix.enable = false;
}
