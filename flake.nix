{
  description = "Sui blockchain binaries";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-23.05"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          overlay = final: prev: import ./overlays final prev;
          overlays = [ overlay ];
          pkgs = import nixpkgs { inherit system overlays; };
        in
          {
            overlays = {
              default = overlay;
            };
            devShell = pkgs.mkShell {
              nativeBuildInputs = [ pkgs.breakpointHook ];
              buildInputs = [
                pkgs.sui-devnet
                pkgs.sui-testnet
                pkgs.sui-mainnet
              ];
            };
          }
      );
}
