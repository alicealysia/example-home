{
  description = "Home Manager configuration of alice";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-defaults = {
      url = "github:alicealysia/home-defaults";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, home-defaults, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      user-modules = [
        ./apps.nix
        ./git.nix
        ./keyboard-shortcuts.nix
        #home-defaults.homeConfigurations.default
        {
          home.username = "alice";
          home.homeDirectory = "/home/alice";
          home.stateVersion = "25.05";
          programs.home-manager.enable = true;
          home.sessionVariables = import ./variables.nix;
          programs.niri.settings.outputs = import ./monitors.nix;
        }
      ];
    in
    {
      homeConfigurations."alice" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = home-defaults.homeModules ++ user-modules;

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      homeModules.default = {
        imports = user-modules;
      };
    };
}
