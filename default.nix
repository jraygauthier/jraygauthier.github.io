{ stdenv, pandoc, coreutils, xdg-utils }:

let
  version = "0.0.0";
in

stdenv.mkDerivation {
  name = "jraygauther-github-io-${version}";

  src = ./.;

  buildInputs = [ pandoc coreutils xdg-utils ];

  installPhase = ''
  '';

  dontPatchELF = true;
  dontStrip = true;

  meta = {
    description = "Raymond Gauthier's Github web site";
  };
}
