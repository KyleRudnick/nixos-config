{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  inputs,
  username,
  gitUsername,
  gitEmail,
  gui,
  waybarChoice,
  extraMonitorSettings,
  keyboardLayout,
  consoleKeyMap,
  terminal,
  browser,
  clock24h,
  thunarEnable,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = lib.mkIf (!config.local.minimal) {
    useUserPackages = true;
    useGlobalPkgs = false;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs username gitUsername gitEmail gui waybarChoice pkgs-unstable extraMonitorSettings keyboardLayout consoleKeyMap terminal browser clock24h thunarEnable;
      stylixImage = config.stylixImage;
    };
    users.${username} = {
      imports = if gui == "none" then [ ./../home/core ] else [ ./../home ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "26.05";
      };
    };
  };

  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    description = "${gitUsername}";
    extraGroups = [
      "adbusers"
      "docker"
      "libvirtd"
      "lp"
      "networkmanager"
      "scanner"
      "wheel"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
  nix.settings.allowed-users = [ "${username}" ];
  nix.settings.trusted-users = [
    "root"
    "${username}"
  ];
}
