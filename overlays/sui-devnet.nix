pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-devnet";

  src = pkgs.fetchurl {
    url = "https://github.com/MystenLabs/sui/releases/download/devnet-v1.5.0/sui";
    sha256 = "3e092d4220712d9af3004c2c3a97a85cbbea81a7349dcf3087c4b46831156f2b";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    mv $src $out/bin/sui
  '';
}
