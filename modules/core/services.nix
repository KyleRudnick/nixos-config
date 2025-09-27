{ profile, ... }:
{
  services = {
    # Kubernetes k3s cluster
    k3s = {
      enable = true;
      role = "server";
      extraFlags = toString [
        "--debug"
      ];
    };
    libinput.enable = true; # Input Handling
    fstrim.enable = true; # SSD Optimizer
    gvfs.enable = true; # For Mounting USB & More
    blueman.enable = true; # Bluetooth Support
    tumbler.enable = true; # Image/video preview
    gnome.gnome-keyring.enable = true;

    smartd = {
      enable = if profile == "vm" then false else true;
      autodetect = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
