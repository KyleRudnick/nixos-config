{config, pkgs, ...}: {
  # Only enable either docker or podman -- Not both
  virtualisation = {
    libvirtd = {
    	enable = true;
    	qemu = {
		swtpm.enable = true;
		ovmf.enable = true;
		ovmf.packages = [ pkgs.OVMFFull.fd ];
    	};
    };
    spiceUSBRedirection.enable = true;
    docker.enable = true;
    podman.enable = false;
  };
  services.spice-vdagentd.enable = true;
  environment.systemPackages = with pkgs; [
    # virt-viewer # View Virtual Machines
    virt-manager
    virt-viewer
    spice 
    spice-gtk
    spice-protocol
    adwaita-icon-theme
  ];
  programs.dconf.enable = true;
}
