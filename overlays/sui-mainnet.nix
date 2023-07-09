pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-mainnet";

  src = pkgs.fetchurl {
    url = "https://github.com/MystenLabs/sui/releases/download/mainnet-v1.4.3/sui";
    sha256 = "e95d8252a87297618d078e560e942ce7d1ae6da8ec200ded9d5e267f4be0e117";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    mv $src $out/bin/sui
  '';
}
