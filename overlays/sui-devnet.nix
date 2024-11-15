pkgs:
let
  version = "1.37.0";
in
pkgs.stdenv.mkDerivation {
  name = "sui-devnet";
  inherit version;

  src = pkgs.fetchzip {
    stripRoot = false;
    url = "https://github.com/MystenLabs/sui/releases/download/devnet-v${version}/sui-devnet-v${version}-ubuntu-x86_64.tgz";
    sha256 = "0j7bn9g8nm6q13mnyjw6czikilx7g0gdc4z0jn8pz975i61sw29n";
  };

  installPhase = ''
    mkdir -p $out/bin
    for b in *; do
      if [ -f "$b" ] && [ -x "$b" ]; then
        cp "$b" $out/bin/
        chmod +x $out/bin/"$b"
      fi
    done
  '';
}
