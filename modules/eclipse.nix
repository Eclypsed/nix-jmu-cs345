{
  pkgs,
  ...
}:

let
  inherit (pkgs.eclipses) eclipse-java eclipseWithPlugins plugins;

  # Eclipse IDE for Java Developers 2024-06 R Package
  eclipse-v2024-06 = eclipse-java.overrideAttrs (oldAttrs: rec {
    version = "2024-06";
    src = pkgs.fetchurl {
      url = "https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/${version}/R/eclipse-java-${version}-R-linux-gtk-x86_64.tar.gz";
      sha256 = "1dgqbpsk6a6y3w58fkp4h5w804gcmvril6j97nkxvj96yb8f6xvx";
    };
  });

  # The Eclipse plugin for Checkstyle v10.17.
  checkstyle-v10-17 = plugins.buildEclipseUpdateSite {
    name = "checkstyle-v10.17";
    src = ../plugins/checkstyle-v10.17;
  };

  # A custom derivation of Eclipse with CS345's requirements.
  eclipse-cs345 = eclipseWithPlugins {
    eclipse = eclipse-v2024-06;
    plugins = [
      checkstyle-v10-17
      plugins.color-theme
    ];
  };

in
{
  inherit eclipse-cs345;
}
