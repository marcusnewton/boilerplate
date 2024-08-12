{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in with pkgs;
      {
        devShell = mkShell {
          buildInputs = [
            # search for packages at https://search.nixos.org/
            nixpkgs-fmt

            # (writeShellScriptBin "name" ''
            # '')
          ];

          # shellHook = ''
          # '';
        };
      }
    );
}
