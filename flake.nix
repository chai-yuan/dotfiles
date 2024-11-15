{
  description = "mydotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    crpkgs.url = "github:chai-yuan/crpkgs";
  };

  outputs = { self, nixpkgs, crpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      crPkgs = crpkgs.packages.${system};
    in {
      devShells.x86_64-linux.default =
        pkgs.mkShell {
          name = "isolated-dev";

          buildInputs = with pkgs; [
            crPkgs.neovim
	    lua-language-server
          ];

          shellHook = ''
            echo "Welcome to the isolated development environment!"
          '';
        };
    };
}
