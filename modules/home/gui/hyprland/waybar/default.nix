{ waybarChoice, ... }:
let
  waybarMap = {
    simple = ./waybar-simple.nix;
    curved = ./waybar-curved.nix;
    nekodyke = ./waybar-nekodyke.nix;
    ddubs = ./waybar-ddubs.nix;
  };
  selectedWaybar = waybarMap.${waybarChoice};
in
{
  imports = [
    selectedWaybar
  ];
}
