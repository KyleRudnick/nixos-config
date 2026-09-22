{ lib, ... }:
let
  mkLuaInline = lib.generators.mkLuaInline;
in
{
  wayland.windowManager.hyprland = {
    settings = {
      env = [
        { _args = [ "NIXOS_OZONE_WL, 1" ]; }
        { _args = [ "NIXPKGS_ALLOW_UNFREE, 1" ]; }
        { _args = [ "XDG_CURRENT_DESKTOP, Hyprland" ]; }
        { _args = [ "XDG_SESSION_TYPE, wayland" ]; }
        { _args = [ "XDG_SESSION_DESKTOP, Hyprland" ]; }
        { _args = [ "GDK_BACKEND, wayland, x11" ]; }
        { _args = [ "CLUTTER_BACKEND, wayland" ]; }
        { _args = [ "QT_QPA_PLATFORM=wayland;xcb" ]; }
        { _args = [ "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1" ]; }
        { _args = [ "QT_AUTO_SCREEN_SCALE_FACTOR, 1" ]; }
        { _args = [ "SDL_VIDEODRIVER, x11" ]; }
        { _args = [ "MOZ_ENABLE_WAYLAND, 1" ]; }
        # Disabling this by default as it can break configurations
        # WIth more than two GPUs.
        # Also added card2 as a further protection should it be enabled
        # This is mostly needed for hybrid laptops
        #"AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1:/dev/card2"
        { _args = [ "GDK_SCALE,1" ]; }
        { _args = [ "QT_SCALE_FACTOR,1" ]; }
        { _args = [ "EDITOR,nvim" ]; }
        # Setting terminal to kitty so running kitty from rofi
        # won't launch in xterm. Which is horrible
        # You can change this to your preferred terminal
        # ToDo: Pull default terminal from host config
        # This should not impact bindings, etc
        { _args = [ "TERMINAL,kitty" ]; }
        { _args = [ "XDG_TERMINAL_EMULATOR,kitty" ]; }
      ];
    };
  };
}
