{
  description = "Sui blockchain binaries";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-23.05"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      pkgs = import nixpkgs { };
      overlay = final: prev: import ./overlays final prev;
    in
    {
      overlays = {
        default = overlay;
      };
    };
}
