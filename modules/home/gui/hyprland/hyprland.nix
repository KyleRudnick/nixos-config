{
  config,
  pkgs,
  lib,
  extraMonitorSettings,
  keyboardLayout,
  stylixImage,
  ...
}:
let
  mkLuaInline = lib.generators.mkLuaInline;
in
{
  home.packages = with pkgs; [
    awww
    grim
    slurp
    wl-clipboard
    swappy
    ydotool
    hyprpolkitagent
    hyprland-qtutils # needed for banners and ANR messages
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];
  # Place Files Inside Home Directory
  home.file = {
    "Pictures/Wallpapers" = {
      source = ../../../../wallpapers;
      recursive = true;
    };
    ".face.icon".source = ./face.jpg;
    ".config/face.jpg".source = ./face.jpg;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    configType = "lua";
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };
    xwayland = {
      enable = true;
    };
    settings = {
      modifier = { _var = "SUPER"; };

      general = {
        layout = "dwindle";
        gaps_in = 2;
        gaps_out = 2;
        border_size = 2;
        resize_on_border = true;
        "col.active_border" = "rgb(${config.lib.stylix.colors.base0B})";
        "col.inactive_border" = "rgb(${config.lib.stylix.colors.base01})";
      };

      misc = {
        layers_hog_keyboard_focus = true;
        initial_workspace_tracking = 0;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = false;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = false;
        vfr = true; # Variable Frame Rate
        vrr = 2; # Variable Refresh Rate  Might need to set to 0 for NVIDIA/AQ_DRM_DEVICES
        # Screen flashing to black momentarily or going black when app is fullscreen
        # Try setting vrr to 0

        #  Application not responding (ANR) settings
        enable_anr_dialog = true;
        anr_missed_pings = 20;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          vibrancy = 0.2;
          ignore_opacity = false;
          new_optimizations = true;
        };
        shadow = {
          enabled = false;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      ecosystem = {
        no_donation_nag = true;
        no_update_news = false;
      };

      cursor = {
        sync_gsettings_theme = true;
        no_hardware_cursors = 2; # change to 1 if want to disable
        enable_hyprcursor = false;
        warp_on_change_workspace = 2;
        no_warps = true;
      };

      render = {
        explicit_sync = 1; # Change to 1 to disable
        explicit_sync_kms = 1;
        direct_scanout = 0;
      };

      master = {
        new_status = "master";
        new_on_top = 1;
        mfact = 0.5;
      };

      input = {
        kb_layout = keyboardLayout;
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 1;
        float_switch_override_focus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          scroll_factor = 0.8;
        };
      };

      gestures = {
        workspace_swipe = 1;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 500;
        workspace_swipe_invert = 1;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = 1;
        workspace_swipe_forever = 1;
      };
    };

    extraConfig = ''
      -- Monitors
      hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
      ${extraMonitorSettings}

      -- Workspaces
      hl.workspace({ name = "1", monitor = "DP-1", default = true })
      hl.workspace({ name = "2", monitor = "DP-1" })
      hl.workspace({ name = "3", monitor = "DP-1" })
      hl.workspace({ name = "4", monitor = "DP-1" })
      hl.workspace({ name = "5", monitor = "DP-1" })
      hl.workspace({ name = "6", monitor = "HDMI-A-2" })
      hl.workspace({ name = "7", monitor = "HDMI-A-2" })
      hl.workspace({ name = "8", monitor = "HDMI-A-2" })
      hl.workspace({ name = "9", monitor = "HDMI-A-2" })
      hl.workspace({ name = "0", monitor = "HDMI-A-2" })

      -- Autostart
      hl.on("hyprland.start", function()
        hl.exec_cmd("[workspace 1 silent] firefox")
        hl.exec_cmd("[workspace 2 silent] ghostty")
        hl.exec_cmd("[workspace 5 silent] spotify")
        hl.exec_cmd("[workspace 6 silent] discord")
        hl.exec_cmd("[workspace 6 silent] easyeffects")
        hl.exec_cmd("hyprctl dispatch workspace 1")
        hl.exec_cmd("wl-paste --type text --watch cliphist store # Stores only text data")
        hl.exec_cmd("wl-paste --type image --watch cliphist store # Stores only image data")
        hl.exec_cmd("dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
        hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
        hl.exec_cmd("systemctl --user start hyprpolkitagent")
        hl.exec_cmd("killall -q awww-daemon;sleep .5 && awww-daemon")
        hl.exec_cmd("killall -q waybar;sleep .5 && waybar")
        hl.exec_cmd("killall -q swaync;sleep .5 && swaync")
        hl.exec_cmd("nm-applet --indicator")
        hl.exec_cmd("pypr &")
        hl.exec_cmd("sleep 1.5 && awww img ${stylixImage}")
      end)

      -- To enable blur on waybar uncomment the line below
      -- Thanks to SchotjeChrisman
      -- layerrule = blur,waybar
    '';
  };
}
