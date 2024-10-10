{
  inputs = {
    # Update inputs with `nix flake update`
    # Or pin nixpkgs to a specific commit hash
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          system = system;
          config.allowUnfree = true;
        };
      in
      with pkgs;
      {
        devShell = mkShell {
          buildInputs = [
            # search for packages at https://search.nixos.org/
            nixpkgs-fmt

            (writeShellScriptBin "hello-world" ''
              echo 'Hello World!'
            '')
          ];

          shellHook = ''
            echo 'Nix dev environment loaded'
          '';
        };
      }
    );
}
