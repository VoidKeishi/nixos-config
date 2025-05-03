{ stdenvNoCC, fetchFromGitHub, lib, ... }:

stdenvNoCC.mkDerivation {
  pname = "electroharmonix-font";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "bf4d01732084be29cedefe9815731700da865956";
    hash = "sha256-JMCG7oviLqwaymfgxzBkpCiNi18BUzPGvd3AF9BYSeo=";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/opentype/electroharmonix
    cp $src/Fonts/Electroharmonix.otf $out/share/fonts/opentype/electroharmonix/
  '';

  meta = {
    description = "Electroharmonix font from the SDDM Astronaut theme (system-wide)";
    homepage    = "https://github.com/Keyitdev/sddm-astronaut-theme";
    license     = lib.licenses.ofl;
    platforms   = lib.platforms.linux;
  };
}
