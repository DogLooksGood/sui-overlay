pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-testnet";

  src = pkgs.fetchzip {
    stripRoot = false;
    url = "https://github.com/MystenLabs/sui/releases/download/testnet-v1.17.0/sui-testnet-v1.17.0-ubuntu-x86_64.tgz";
    sha256 = "sha256-qCOpM//qRbjZBkJpoNEfyp44YPlQ3wlE5qgRNIGwk6E=";
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
