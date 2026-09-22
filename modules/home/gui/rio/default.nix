{
  pkgs,
  inputs,
  ...
}:
{

  programs.rio = {
    enable = true;
    package = inputs.rio.packages.${pkgs.system}.rio;
  };
  home.file."./.config/rio/config.toml".text = ''
    [colors]
    background = "#031a16"
    black = "#0b342d"
    blue = "#96883e"
    cursor = "#81b5ac"
    cyan = "#963e4c"
    dim-black = "#0b342d"
    dim-blue = "#96883e"
    dim-cyan = "#963e4c"
    dim-foreground = "#81b5ac"
    dim-green = "#883e96"
    dim-magenta = "#4c963e"
    dim-red = "#3e9688"
    dim-white = "#5f9c92"
    dim-yellow = "#3e4c96"
    foreground = "#81b5ac"
    green = "#883e96"
    light-black = "#184e45"
    light-blue = "#96883e"
    light-cyan = "#963e4c"
    light-foreground = "#81b5ac"
    light-green = "#883e96"
    light-magenta = "#4c963e"
    light-red = "#3e9688"
    light-white = "#d2e7e4"
    light-yellow = "#3e4c96"
    magenta = "#4c963e"
    red = "#3e9688"
    selection-background = "#184e45"
    selection-foreground = "#81b5ac"
    tabs = "#0b342d"
    tabs-active = "#184e45"
    white = "#a7cec8"
    yellow = "#3e4c96"

    [fonts]
    family = "JetBrains Mono"
    size = 20.0
    [fonts.emoji]
    family = "Noto Color Emoji"

    [window]
    opacity = 1.0
    [cursor]
    shape = 'block'
    [navigation]
    mode = "Plain"
    [renderer]
    performance = "High"
  '';
}
