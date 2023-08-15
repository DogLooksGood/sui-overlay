pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-testnet";

  src = pkgs.fetchurl {
    url = "https://github.com/MystenLabs/sui/releases/download/testnet-v1.7.0/sui-testnet-v1.7.0-ubuntu-x86_64.tgz";
    sha256 = "a37944ebdab76a202f34f2ada7691082964fce3e32a283d3578ef72bb37b41ac";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    mv $src/target/release/sui-ubuntu-x86_64 $out/bin/sui
  '';
}
