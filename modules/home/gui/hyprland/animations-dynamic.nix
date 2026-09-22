{lib, ...}: let
  mkLuaInline = lib.generators.mkLuaInline;
in {
  wayland.windowManager.hyprland.settings = {
    # name "Dynamic"
    # credit https://github.com/mylinuxforwork/dotfiles
    animations = {
      enabled = true;
      bezier = [
        { _args = [ "wind, 0.05, 0.9, 0.1, 1.05" ]; }
        { _args = [ "winIn, 0.1, 1.1, 0.1, 1.1" ]; }
        { _args = [ "winOut, 0.3, -0.3, 0, 1" ]; }
        { _args = [ "liner, 1, 1, 1, 1" ]; }
      ];
      animation = [
        { _args = [ "windows, 1, 6, wind, slide" ]; }
        { _args = [ "windowsIn, 1, 6, winIn, slide" ]; }
        { _args = [ "windowsOut, 1, 5, winOut, slide" ]; }
        { _args = [ "windowsMove, 1, 5, wind, slide" ]; }
        { _args = [ "border, 1, 1, liner" ]; }
        { _args = [ "borderangle, 1, 30, liner, loop" ]; }
        { _args = [ "fade, 1, 10, default" ]; }
        { _args = [ "workspaces, 1, 5, wind" ]; }
      ];
    };
  };
}
