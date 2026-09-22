{ extraMonitorSettings, lib, ... }:
let
  mkLuaInline = lib.generators.mkLuaInline;
in
{
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        { _args = [ "tag +file-manager, class:^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$" ]; }
        { _args = [ "tag +terminal, class:^(com.mitchellh.ghostty|org.wezfurlong.wezterm|Alacritty|kitty|kitty-dropterm)$" ]; }
        { _args = [ "tag +browser, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$" ]; }
        { _args = [ "tag +browser, class:^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$" ]; }
        { _args = [ "tag +browser, class:^([Tt]horium-browser|[Cc]achy-browser)$" ]; }
        { _args = [ "tag +projects, class:^(codium|codium-url-handler|VSCodium)$" ]; }
        { _args = [ "tag +projects, class:^(VSCode|code-url-handler)$" ]; }
        { _args = [ "tag +im, class:^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$" ]; }
        { _args = [ "tag +im, class:^([Ff]erdium)$" ]; }
        { _args = [ "tag +im, class:^([Ww]hatsapp-for-linux)$" ]; }
        { _args = [ "tag +im, class:^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$" ]; }
        { _args = [ "tag +im, class:^(teams-for-linux)$" ]; }
        { _args = [ "tag +games, class:^(gamescope)$" ]; }
        { _args = [ "tag +games, class:^(steam_app_\\d+)$" ]; }
        { _args = [ "tag +gamestore, class:^([Ss]team)$" ]; }
        { _args = [ "tag +gamestore, title:^([Ll]utris)$" ]; }
        { _args = [ "tag +gamestore, class:^(com.heroicgameslauncher.hgl)$" ]; }
        { _args = [ "tag +settings, class:^(gnome-disks|wihotspot(-gui)?)$" ]; }
        { _args = [ "tag +settings, class:^([Rr]ofi)$" ]; }
        { _args = [ "tag +settings, class:^(file-roller|org.gnome.FileRoller)$" ]; }
        { _args = [ "tag +settings, class:^(nm-applet|nm-connection-editor|blueman-manager)$" ]; }
        { _args = [ "tag +settings, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$" ]; }
        { _args = [ "tag +settings, class:^(nwg-look|qt5ct|qt6ct|[Yy]ad)$" ]; }
        { _args = [ "tag +settings, class:(xdg-desktop-portal-gtk)" ]; }
        { _args = [ "tag +settings, class:(.blueman-manager-wrapped)" ]; }
        { _args = [ "tag +settings, class:(nwg-displays)" ]; }
        { _args = [ "move 72% 7%,title:^(Picture-in-Picture)$" ]; }
        { _args = [ "center, class:^([Ff]erdium)$" ]; }
        { _args = [ "float, class:^([Ww]aypaper)$" ]; }
        { _args = [ "center, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$" ]; }
        { _args = [ "center, class:([Tt]hunar), title:negative:(.*[Tt]hunar.*)" ]; }
        { _args = [ "center, title:^(Authentication Required)$" ]; }
        { _args = [ "idleinhibit fullscreen, class:^(*)$" ]; }
        { _args = [ "idleinhibit fullscreen, title:^(*)$" ]; }
        { _args = [ "idleinhibit fullscreen, fullscreen:1" ]; }
        { _args = [ "float, tag:settings*" ]; }
        { _args = [ "float, class:^([Ff]erdium)$" ]; }
        { _args = [ "float, title:^(Picture-in-Picture)$" ]; }
        { _args = [ "float, class:^(mpv|com.github.rafostar.Clapper)$" ]; }
        { _args = [ "float, title:^(Authentication Required)$" ]; }
        { _args = [ "float, class:(codium|codium-url-handler|VSCodium), title:negative:(.*codium.*|.*VSCodium.*)" ]; }
        { _args = [ "float, class:^(com.heroicgameslauncher.hgl)$, title:negative:(Heroic Games Launcher)" ]; }
        { _args = [ "float, class:^([Ss]team)$, title:negative:^([Ss]team)$" ]; }
        { _args = [ "float, class:([Tt]hunar), title:negative:(.*[Tt]hunar.*)" ]; }
        { _args = [ "float, initialTitle:(Add Folder to Workspace)" ]; }
        { _args = [ "float, initialTitle:(Open Files)" ]; }
        { _args = [ "float, initialTitle:(wants to save)" ]; }
        { _args = [ "size 70% 60%, initialTitle:(Open Files)" ]; }
        { _args = [ "size 70% 60%, initialTitle:(Add Folder to Workspace)" ]; }
        { _args = [ "size 70% 70%, tag:settings*" ]; }
        { _args = [ "size 60% 70%, class:^([Ff]erdium)$" ]; }
        { _args = [ "opacity 1.0 1.0, tag:browser*" ]; }
        { _args = [ "opacity 0.9 0.8, tag:projects*" ]; }
        { _args = [ "opacity 0.94 0.86, tag:im*" ]; }
        { _args = [ "opacity 0.9 0.8, tag:file-manager*" ]; }
        { _args = [ "opacity 1.0 1.0, tag:terminal*" ]; }
        { _args = [ "opacity 0.8 0.7, tag:settings*" ]; }
        { _args = [ "opacity 0.8 0.7, class:^(gedit|org.gnome.TextEditor|mousepad)$" ]; }
        { _args = [ "opacity 0.9 0.8, class:^(seahorse)$ # gnome-keyring gui" ]; }
        { _args = [ "opacity 0.95 0.75, title:^(Picture-in-Picture)$" ]; }
        { _args = [ "pin, title:^(Picture-in-Picture)$" ]; }
        { _args = [ "keepaspectratio, title:^(Picture-in-Picture)$" ]; }
        { _args = [ "noblur, tag:games*" ]; }
        { _args = [ "fullscreen, tag:games*" ]; }
      ];
    };

    extraConfig = ''
      ${extraMonitorSettings}
    '';
  };
}
