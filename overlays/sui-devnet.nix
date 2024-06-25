pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-devnet";

  # Pass stripRoot=false; to fetchzip to assume flat list of files.
  # devnet
  # |--target/release/*
  # |--external-crates/move/target/release/move-analyzer
  src = pkgs.fetchzip {
    stripRoot = false;
    url = "https://github.com/MystenLabs/sui/releases/download/devnet-v1.27.0/sui-devnet-v1.27.0-ubuntu-x86_64.tgz";
    sha256 = "sha256-MFZBquQyDCg7w3T4UPbVfbKfRE8bM0Aaw1cd9/j4FTU=";
  };

  installPhase = ''
    mkdir -p $out/bin
    for b in *; do
        cp $b $out/bin/$b
    done
  '';
}
