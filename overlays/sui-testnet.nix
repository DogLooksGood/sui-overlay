pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-testnet";

  src = pkgs.fetchzip {
    url = "https://github.com/MystenLabs/sui/releases/download/testnet-v1.7.0/sui-testnet-v1.7.0-ubuntu-x86_64.tgz";
    sha256 = "sha256-agJl/rml/oLeEBn7BBmnhGKZFMxpTP3qedmaqrpATmk=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp $src/release/sui-ubuntu-x86_64 $out/bin/sui
  '';
}
