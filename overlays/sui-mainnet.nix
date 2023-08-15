pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-mainnet";

  src = pkgs.fetchzip {
    url = "https://github.com/MystenLabs/sui/releases/download/mainnet-v1.6.3/sui-mainnet-v1.6.3-ubuntu-x86_64.tgz";
    sha256 = "sha256-jCpQUtEq8ssh0XP+bRBECmHGv9SGAJSigHdZAwX3C6w=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp $src/release/sui-ubuntu-x86_64 $out/bin/sui
 '';
}
