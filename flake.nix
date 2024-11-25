{
  description = "my system packages collection";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    crPkgs.url = "github:chai-yuan/crpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      crPkgs,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      crpkgs = crPkgs.packages.${system};
    in
    {
      packages.x86_64-linux = {

        my-package = pkgs.buildEnv {
          name = "my-package-collection";
          paths = [
            crpkgs.neovim
            pkgs.nerdfonts
            pkgs.lua-language-server
            pkgs.nixd
            pkgs.nixfmt-rfc-style
            pkgs.htop
          ];
        };

      };
    };
}
