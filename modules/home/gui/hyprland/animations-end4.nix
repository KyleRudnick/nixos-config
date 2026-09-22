{ lib, ... }:
let
  mkLuaInline = lib.generators.mkLuaInline;
in
{
  wayland.windowManager.hyprland.settings = {
    # Name: END-4
    # Credit: END-4 project https://github.com/end-4/dots-hyprland
    animations = {
      enabled = false;
      bezier = [
        { _args = [ "linear, 0, 0, 1, 1" ]; }
        { _args = [ "md3_standard, 0.2, 0, 0, 1" ]; }
        { _args = [ "md3_decel, 0.05, 0.7, 0.1, 1" ]; }
        { _args = [ "md3_accel, 0.3, 0, 0.8, 0.15" ]; }
        { _args = [ "overshot, 0.05, 0.9, 0.1, 1.1" ]; }
        { _args = [ "crazyshot, 0.1, 1.5, 0.76, 0.92 " ]; }
        { _args = [ "hyprnostretch, 0.05, 0.9, 0.1, 1.0" ]; }
        { _args = [ "menu_decel, 0.1, 1, 0, 1" ]; }
        { _args = [ "menu_accel, 0.38, 0.04, 1, 0.07" ]; }
        { _args = [ "easeInOutCirc, 0.85, 0, 0.15, 1" ]; }
        { _args = [ "easeOutCirc, 0, 0.55, 0.45, 1" ]; }
        { _args = [ "easeOutExpo, 0.16, 1, 0.3, 1" ]; }
        { _args = [ "softAcDecel, 0.26, 0.26, 0.15, 1" ]; }
        { _args = [ "md2, 0.4, 0, 0.2, 1 # use with .2s duration" ]; }
      ];
      animation = [
        { _args = [ "windows, 1, 3, md3_decel, popin 60%" ]; }
        { _args = [ "windowsIn, 1, 3, md3_decel, popin 60%" ]; }
        { _args = [ "windowsOut, 1, 3, md3_accel, popin 60%" ]; }
        { _args = [ "border, 1, 10, default" ]; }
        { _args = [ "fade, 1, 3, md3_decel" ]; }
        { _args = [ "layersIn, 1, 3, menu_decel, slide" ]; }
        { _args = [ "layersOut, 1, 1.6, menu_accel" ]; }
        { _args = [ "fadeLayersIn, 1, 2, menu_decel" ]; }
        { _args = [ "fadeLayersOut, 1, 4.5, menu_accel" ]; }
        { _args = [ "workspaces, 1, 7, menu_decel, slide" ]; }
      ];
    };
  };
}
