{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
  };
  home.file."./.config/ghostty/config".text = ''

    theme = stylix
    background-opacity = 1.0
    font-size = 14
    initial-command = "zellij -l welcome"
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
      #   #font-familykkk-bold-italic = JetBrainsMono NFM Bold Italic
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
  '';
}
