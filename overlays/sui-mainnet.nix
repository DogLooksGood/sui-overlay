pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-mainnet";

  src = pkgs.fetchurl {
    url = "https://github.com/MystenLabs/sui/releases/download/mainnet-v1.6.3/sui-mainnet-v1.6.3-ubuntu-x86_64.tgz";
    sha256 = "78dea98395ff79ded89fefa7f677e8c427ba7f9825b8a8aac211e9597763d9cb";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    mv $src/target/release/sui-ubuntu-x86_64 $out/bin/sui
  '';
}
