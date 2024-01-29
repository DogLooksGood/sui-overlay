pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-mainnet";

  src = pkgs.fetchzip {
    url = "https://github.com/MystenLabs/sui/releases/download/mainnet-v1.16.2/sui-mainnet-v1.16.2-ubuntu-x86_64.tgz";
    sha256 = "sha256-I8hV04zJQ1/c5aNc3MdOC0i4t5DQgod3rOdv4PosEL4=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cd $src/target/release
    for b in *; do
        cp ''${b} $out/bin/''${b%-ubuntu-x86_64}
    done
 '';
}
