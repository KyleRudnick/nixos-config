{
  pkgs,
  host,
  ...
}: let
  inherit (import ../../hosts/${host}/variables.nix) stylixImage;
in {
  # Styling Options
  stylix = {
    enable = true;
    image = stylixImage;
    base16Scheme = {
	base00= "031A16";
	base01= "0B342D";
	base02= "184E45";
	base03= "2B685E";
	base04= "5F9C92";
	base05= "81B5AC";
	base06= "A7CEC8";
	base07= "D2E7E4";
	base08= "3E9688";
	base09= "3E7996";
	base0A= "3E4C96";
	base0B= "883E96";
	base0C= "963E4C";
	base0D= "96883E";
	base0E= "4C963E";
	base0F= "3E965B";
    };
    polarity = "dark";
    opacity.terminal = 1.0;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };
  };
}
