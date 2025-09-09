{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "Kyle Rudnick";
  gitEmail = "rudnick.kyle@gmail.com";

  # Hyprland Settings
  # ex "monitor=DP-1, 1920x1080@144,auto,1"
  #
  extraMonitorSettings = "
    monitor = DP-1, 1920x1080@144,0x0, 1 
    monitor = HDMI-A-2, 1920x1080@60, -1920x0, 1 
    ";

  # Waybar Settings
  clock24h = true;

  # Program Options
  browser = "firefox"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "ghostty"; # Set Default System Terminal
  keyboardLayout = "us,de";
  consoleKeyMap = "us";

  # For Nvidia Prime support
  intelID = "PCI:1:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;

  # Enable Printing Support
  printEnable = true;

  # Set Stylix Image
  stylixImage = ../../wallpapers/firewatch.jpg;

  waybarChoice = ../../modules/home/waybar/waybar-nekodyke.nix;

  # Enable Thunar GUI File Manager
  thunarEnable = true;
}
