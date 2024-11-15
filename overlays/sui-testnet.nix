pkgs:
let
  version = "1.37.2";
in
pkgs.stdenv.mkDerivation {
  name = "sui-testnet";
  inherit version;

  src = pkgs.fetchzip {
    stripRoot = false;
    url = "https://github.com/MystenLabs/sui/releases/download/testnet-v${version}/sui-testnet-v${version}-ubuntu-x86_64.tgz";
    sha256 = "0am30i64nqnq8d7dmk9g4hx78fpxplsd836qv9hbhvx5wr3lj2j6";
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
