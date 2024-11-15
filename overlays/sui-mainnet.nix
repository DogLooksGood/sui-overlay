pkgs:
let
  version = "1.36.2";
in
pkgs.stdenv.mkDerivation {
  name = "sui-mainnet";
  inherit version;

  src = pkgs.fetchzip {
    stripRoot = false;
    url = "https://github.com/MystenLabs/sui/releases/download/mainnet-v${version}/sui-mainnet-v${version}-ubuntu-x86_64.tgz";
    sha256 = "1zvxxbnxv3q8y7r82fg7r1i6jldqqm1piviylvc51i1b6hzih6ny";
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
