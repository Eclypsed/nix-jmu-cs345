{
  config,
  lib,
  pkgs,
  ...
}:
let
  eclipse = import ./eclipse.nix { inherit pkgs; };
  inherit (eclipse) eclipse-cs345;
in
with lib;
{
  options.programs.nix-jmu-cs345 = {
    enable = mkEnableOption "nix-jmu-cs345";
  };

  config = mkIf config.programs.nix-jmu-cs345.enable {
    home.packages = with pkgs; [
      jdk
      eclipse-cs345
    ];
  };
}
