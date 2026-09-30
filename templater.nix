{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.templater";
  version = "2.25.1";
  repo = "https://github.com/SilentVoid13/Templater";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-64bZKCaUzh8JkVTDIChv3YlHPmDcJEHuMQ86wzEzPpQ=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-uZKA0sSrLNIq0BDBL67t8lW884XRJ9lzuJ+F3rJ9I/0=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-uZKA0sSrLNIq0BDBL67t8lW884XRJ9lzuJ+F3rJ9I/0=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
