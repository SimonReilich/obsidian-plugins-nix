{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.git";
  version = "2.40.0";
  repo = "https://github.com/Vinzent03/obsidian-git";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-bxmPFAvjklTEEMIZmMG9hvmgd61BVgQ1Y4Ll3Fg24aE=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-yfDUnCCUxHUbl+OVAVtJdhZRlEw3HLpnu/akYXDyy5E=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-yfDUnCCUxHUbl+OVAVtJdhZRlEw3HLpnu/akYXDyy5E=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
