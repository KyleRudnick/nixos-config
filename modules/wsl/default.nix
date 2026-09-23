{ username, ... }:
{
  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    defaultUser = username;
    startMenuLaunchers = true;
  };

  environment.enableAllTerminfo = true;
  security.sudo.wheelNeedsPassword = false;
}
