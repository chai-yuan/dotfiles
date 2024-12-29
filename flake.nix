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
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      crpkgs = crPkgs.packages.${system};
    in
    {
      packages.x86_64-linux = {

        basic-tools = pkgs.buildEnv {
          name = "Basic tools";
          paths = [
            pkgs.neovim
            pkgs.nerdfonts
            pkgs.ripgrep
            pkgs.python3
            pkgs.lua-language-server
            pkgs.nixd
            pkgs.nixfmt-rfc-style
            pkgs.xclip
            pkgs.xsel
          ];
        };

        desktop-applications = pkgs.buildEnv {
          name = "desktop-applications";
          paths =
            [
            ];
        };

      };
    };
}
