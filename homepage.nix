{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.homepage";
  version = "4.5.0";
  repo = "https://github.com/mirnovov/obsidian-homepage";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-VnsU5ueRMwG0bZth/TakCB+n3hgY8ZJsH8tYZ5KqsgE=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-Xn4gCFyVLRChDTc8pXGFFpl/UrLf6uFifK/Jxw+N8pw=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-Xn4gCFyVLRChDTc8pXGFFpl/UrLf6uFifK/Jxw+N8pw=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
