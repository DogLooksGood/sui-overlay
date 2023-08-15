pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-devnet";

  src = pkgs.fetchzip {
    url = "https://github.com/MystenLabs/sui/releases/download/devnet-v1.7.0/sui-devnet-v1.7.0-ubuntu-x86_64.tgz";
    sha256 = "sha256-/HwyetDYcxjdKgopdaC+ionsuW/Qd9I3VJOcNgz8TPs=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp $src/release/sui-ubuntu-x86_64 $out/bin/sui
  '';
}
