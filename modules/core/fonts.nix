{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      noto-fonts-cjk-sans
      jetbrains-mono
      font-awesome
      symbola
      material-icons
      fira-code
      fira-code-symbols
    ];
  };
}
