{
  description = "my system packages collection";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    crpkgs.url = "github:chai-yuan/crpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      crpkgs,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      crPkgs = crpkgs.packages.${system};
    in
    {
      packages.x86_64-linux = {

        my-package = pkgs.buildEnv {
          name = "my-package-collection";
          paths = [
            crPkgs.neovim
            pkgs.lua-language-server
            pkgs.nixd
            pkgs.nixfmt-rfc-style
            pkgs.htop
          ];
        };

      };
    };
}
