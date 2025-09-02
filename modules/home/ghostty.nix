{ pkgs, ... }:
{
  programs.ghostty = {
    enable = false;
    package = pkgs.ghostty;
  };
  # home.file."./.config/ghostty/config".text = ''
  #
  #   # #theme = Aura
  #   # #theme = Dracula
  #   # #theme = Aardvark Blue
  #   # #theme = GruvboxDarkHard
  #   # adjust-cell-height = 10%
  #   # window-theme = dark
  #   # window-height = 32
  #   # window-width = 110
  #   # background-opacity = 0.95
  #   # background-blur-radius = 60
  #   # selection-background = #2d3f76
  #   # selection-foreground = #c8d3f5
  #   # cursor-style = bar
  #   # mouse-hide-while-typing = true
  #
  #   # keybindings
  #   keybind = alt+s>r=reload_config
  #   keybind = alt+s>x=close_surface
  #
  #   keybind = alt+s>n=new_window
  #
  #   # other
  #   #copy-on-select = clipboard
  #
  #   font-size = 12
  #   #font-family = JetBrainsMono Nerd Font Mono
  #   #font-family-bold = JetBrainsMono NFM Bold
  #   #font-family-bold-italic = JetBrainsMono NFM Bold Italic
  #   #font-family-italic = JetBrainsMono NFM Italic
  #
  #   font-family = BerkeleyMono Nerd Font
  #   #font-family = Iosevka Nerd Font
  #   # font-family = SFMono Nerd Font
  #
  #   title = "GhosTTY"
  #
  #   wait-after-command = false
  #   shell-integration = detect
  #   window-save-state = always
  #   gtk-single-instance = true
  #   unfocused-split-opacity = 0.5
  #   quick-terminal-position = center
  #   shell-integration-features = cursor,sudo
  # '';
}
