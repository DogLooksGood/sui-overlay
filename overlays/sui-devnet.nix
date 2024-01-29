pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-devnet";

  # Pass stripRoot=false; to fetchzip to assume flat list of files.
  # devnet
  # |--target/release/*
  # |--external-crates/move/target/release/move-analyzer
  src = pkgs.fetchzip {
    stripRoot = false;
    url = "https://github.com/MystenLabs/sui/releases/download/devnet-v1.17.0/sui-devnet-v1.17.0-ubuntu-x86_64.tgz";
    sha256 = "sha256-pAduyLgqJINzW0nDky1zbo6ZaXcm7hAxOQ6+E2/q4LY=";

  };

  installPhase = ''
    mkdir -p $out/bin
    cp $src/external-crates/move/target/release/move-analyzer-ubuntu-x86_64 $out/bin/move-analyzer
    cd $src/target/release
    for b in *; do
        cp ''${b} $out/bin/''${b%-ubuntu-x86_64}
    done
  '';
}
