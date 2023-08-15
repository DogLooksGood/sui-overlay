pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-devnet";

  src = pkgs.fetchurl {
    url = "https://github.com/MystenLabs/sui/releases/download/devnet-v1.7.0/sui-devnet-v1.7.0-ubuntu-x86_64.tgz";
    sha256 = "366217e288f222827193eb5ac9c404c68de0f683f10eb2dcec1c408fa6d576ce";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    mv $src/target/release/sui-ubuntu-x86_64 $out/bin/sui
  '';
}
