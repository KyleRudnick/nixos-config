{lib, ...}: let
  mkLuaInline = lib.generators.mkLuaInline;
in {
  wayland.windowManager.hyprland.settings = {
    # name "moving"
    # credit https://github.com/mylinuxforwork/dotfiles
    animations = {
      enabled = true;
      bezier = [
        { _args = [ "overshot, 0.05, 0.9, 0.1, 1.05" ]; }
        { _args = [ "smoothOut, 0.5, 0, 0.99, 0.99" ]; }
        { _args = [ "smoothIn, 0.5, -0.5, 0.68, 1.5" ]; }
      ];
      animation = [
        { _args = [ "windows, 1, 5, overshot, slide" ]; }
        { _args = [ "windowsOut, 1, 3, smoothOut" ]; }
        { _args = [ "windowsIn, 1, 3, smoothOut" ]; }
        { _args = [ "windowsMove, 1, 4, smoothIn, slide" ]; }
        { _args = [ "border, 1, 5, default" ]; }
        { _args = [ "fade, 1, 5, smoothIn" ]; }
        { _args = [ "fadeDim, 1, 5, smoothIn" ]; }
        { _args = [ "workspaces, 1, 6, default" ]; }
      ];
    };
  };
}
