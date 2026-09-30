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
    sha256 = "sha256-1nsCERRlyRexvNo8K9/uGF5CnbfQdGv2bxN+1NlItOo=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-vEt2iG65/COlMTtX8gw49cRSlbeizcwjFWm7JvLnNFI=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-vEt2iG65/COlMTtX8gw49cRSlbeizcwjFWm7JvLnNFI=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
