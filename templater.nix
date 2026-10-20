{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.templater";
  version = "2.26.0";
  repo = "https://github.com/SilentVoid13/Templater";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-Cs1Fz9s6czfivvURaZvB+BncZGRa00gN8zV51C0ty6o=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-kcn6hRAIL/+gs9AiqsSYbjs5IpWxEm6Efq1+1yiRabg=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-kcn6hRAIL/+gs9AiqsSYbjs5IpWxEm6Efq1+1yiRabg=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
