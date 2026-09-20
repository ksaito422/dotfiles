{
  description = "My dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-darwin,
      ...
    }:
    {
      darwinConfigurations."MacBook-Air" = nix-darwin.lib.darwinSystem {
        modules = [
          ./nix-darwin/configuration.nix
          home-manager.darwinModules.home-manager
        ];
      };

      # 管理者権限なしで `home-manager switch --flake .#saito-work` を実行するための構成。
      # darwin-rebuild(要sudo) を経由せず、home-manager 単体でユーザー環境のみ適用する。
      homeConfigurations."saito-work" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-darwin";
        modules = [
          ./home-manager/home.nix
          {
            home.username = "saito-work";
            home.homeDirectory = "/Users/saito-work";
          }
        ];
      };
    };
}
