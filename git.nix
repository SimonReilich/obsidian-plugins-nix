{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.git";
  version = "2.42.0";
  repo = "https://github.com/Vinzent03/obsidian-git";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-SW2xSLzqQWn0VeI0uwLwj4xQwxfArVr947J8CQTa8TM=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-etmOjM4VfphGtHlBxqfLmwIrydXG0ReCKQ56ehZLRw0=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-etmOjM4VfphGtHlBxqfLmwIrydXG0ReCKQ56ehZLRw0=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
