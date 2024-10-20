{
  description = "Typst flake";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:s1syph0s/nixpkgs";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system: 
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = with pkgs; mkShell ({
          name = "typst-shell";
          packages = [ 
            typst
            typst-lsp
          ];
        });
      }
    );
}
