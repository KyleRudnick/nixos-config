{config, pkgs, pkgs-unstable, ... }:
{
   programs.zellij = {
	enable = true;
	package = pkgs-unstable.zellij;
   };


  home.file.".config/zellij/config.kdl".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/zellij/config.kdl";
}
