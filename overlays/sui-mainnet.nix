pkgs: pkgs.stdenv.mkDerivation {
  name = "sui-mainnet";

  src = pkgs.fetchzip {
    stripRoot = false;
    url = "https://github.com/MystenLabs/sui/releases/download/mainnet-v1.27.2/sui-mainnet-v1.27.2-ubuntu-x86_64.tgz";
    sha256 = "sha256-aZv3rUKq0fK4YHR6ibVzpwVQeYtm22amxISmcKK8/5M=";
  };

  installPhase = ''
    mkdir -p $out/bin
    for b in *; do
        cp $b $out/bin/$b
    done
 '';
}
