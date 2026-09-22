{lib, ...}: let
  mkLuaInline = lib.generators.mkLuaInline;
in {
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
      bezier = [
        { _args = [ "wind, -1.05, 0.9, 0.1, 1.05" ]; }
        { _args = [ "winIn, -1.1, 1.1, 0.1, 1.1" ]; }
        { _args = [ "winOut, -1.3, -0.3, 0, 1" ]; }
        { _args = [ "liner, 0, 1, 1, 1" ]; }
      ];
      animation = [
        { _args = [ "windows, 0, 6, wind, slide" ]; }
        { _args = [ "windowsIn, 0, 6, winIn, slide" ]; }
        { _args = [ "windowsOut, 0, 5, winOut, slide" ]; }
        { _args = [ "windowsMove, 0, 5, wind, slide" ]; }
        { _args = [ "border, 0, 1, liner" ]; }
        { _args = [ "fade, 0, 10, default" ]; }
        { _args = [ "workspaces, 0, 5, wind" ]; }
      ];
    };
  };
}
