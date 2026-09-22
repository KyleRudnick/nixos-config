#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOSTS_DIR="$SCRIPT_DIR/hosts"

# --- Error handling ---
trap 'echo ""; echo "Error: Setup failed. Check output above for details." >&2' ERR

mkdir -p "$HOSTS_DIR"

echo "=== NixOS Host Setup ==="
echo ""

# --- Hostname (prompt until unique) ---
while true; do
  read -rp "Hostname: " hostname
  [ -z "$hostname" ] && echo "  Hostname cannot be empty." && continue

  if [ -d "$HOSTS_DIR/$hostname" ]; then
    read -rp "Host '$hostname' already exists. Regenerate? (y/N): " regen_choice
    if [[ "$regen_choice" =~ ^[Yy]$ ]]; then
      rm -rf "$HOSTS_DIR/$hostname"
      break
    else
      echo "  Choose a different hostname."
    fi
  else
    break
  fi
done

HOST_DIR="$HOSTS_DIR/$hostname"
mkdir -p "$HOST_DIR"

# --- Basic info ---
read -rp "Username: " username
[ -z "$username" ] && echo "Error: Username cannot be empty." && exit 1

# --- Profile selection ---
echo ""
echo "Profiles:"
echo "  1) desktop  - Full system with home-manager and all user packages"
echo "  2) laptop   - Full system with GUI support and home-manager"
echo "  3) vm       - Minimal system without GUI (CLI-focused, QEMU guest services)"
echo ""

while true; do
  read -rp "Profile [desktop]: " profile_input
  profile_input="${profile_input:-desktop}"
  case "$profile_input" in
    1|desktop)  profile="desktop"; break ;;
    2|laptop)   profile="laptop"; break ;;
    3|vm)       profile="vm"; break ;;
    *)          echo "  Invalid choice. Enter 1, 2, 3, or the profile name." ;;
  esac
done

# --- GUI environment selection (skip for vm) ---
gui="none"
if [ "$profile" != "vm" ]; then
  echo ""
  echo "GUI Environment:"
  echo "  1) hyprland  - Hyprland (tiling window manager)"
  echo "  2) pantheon  - Pantheon (traditional desktop, coming soon)"
  echo ""

  while true; do
    read -rp "GUI environment [hyprland]: " gui_input
    gui_input="${gui_input:-1}"
    case "$gui_input" in
      1|hyprland)  gui="hyprland"; break ;;
      2|pantheon)  gui="pantheon"; break ;;
      *)           echo "  Invalid choice. Enter 1, 2, or the environment name." ;;
    esac
  done
fi

# --- GPU driver selection ---
echo ""
echo "GPU drivers:"
echo "  1) nvidia       - Nvidia proprietary drivers"
echo "  2) amd          - AMD GPU drivers (amdgpu + ROCm)"
echo "  3) intel        - Intel graphics (media driver, vaapi)"
echo "  4) nvidia-prime - Hybrid GPU offload (Intel iGPU + Nvidia dGPU)"
echo "  5) none         - No dedicated GPU drivers"
echo ""

enable_nvidia="false"
enable_amd="false"
enable_intel="false"
enable_prime="false"

while true; do
  read -rp "GPU driver [none]: " gpu_input
  gpu_input="${gpu_input:-5}"
  case "$gpu_input" in
    1|nvidia)       enable_nvidia="true"; break ;;
    2|amd)          enable_amd="true"; break ;;
    3|intel)        enable_intel="true"; break ;;
    4|nvidia-prime) enable_prime="true"; enable_nvidia="true"; break ;;
    5|none)         break ;;
    *)              echo "  Invalid choice. Enter 1, 2, 3, 4, 5, or the driver name." ;;
  esac
done

# --- Nvidia-prime bus IDs (only if prime selected) ---
intel_id="PCI:1:0:0"
nvidia_id="PCI:0:2:0"
if [ "$enable_prime" = "true" ]; then
  echo ""
  echo "Nvidia Prime requires PCI bus IDs for both GPUs."
  echo "Find them with: lspci | grep -i 'vga\\|3d'"
  echo ""
  read -rp "Intel bus ID [PCI:1:0:0]: " intel_id_input
  intel_id="${intel_id_input:-$intel_id}"
  read -rp "Nvidia bus ID [PCI:0:2:0]: " nvidia_id_input
  nvidia_id="${nvidia_id_input:-$nvidia_id}"
fi

# --- Generate hardware.nix ---
echo ""
echo "Generating hardware configuration..."
if command -v nixos-generate-config &>/dev/null; then
  sudo nixos-generate-config --show-hardware-config > "$HOST_DIR/hardware.nix"
  echo "  hardware.nix generated from current system."
else
  echo "  Warning: nixos-generate-config not found. Writing placeholder hardware.nix."
  cat > "$HOST_DIR/hardware.nix" << 'HARDWARENIX'
# Generate this file on a NixOS system with: sudo nixos-generate-config --show-hardware-config > hosts/<hostname>/hardware.nix
{ ... }:
{
  boot.initrd.availableKernelModules = [ ];
  boot.kernelModules = [ ];
  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; fsType = "ext4"; };
}
HARDWARENIX
fi

# --- Generate local.nix ---
cat > "$HOST_DIR/local.nix" << LOCALNIX
{
  hostname = "${hostname}";
  profile = "${profile}";
  username = "${username}";
  gui = "${gui}";

  # Hyprland monitor settings
  # Examples:
  #   monitor = DP-1, 1920x1080@144, 0x0, 1
  #   monitor = HDMI-A-1, 2560x1440@60, 1920x0, 1
  # See: https://wiki.hyprland.org/Configuring/Monitors/
  extraMonitorSettings = "";

  intelID = "${intel_id}";
  nvidiaID = "${nvidia_id}";
}
LOCALNIX

# --- Generate drivers.nix ---
cat > "$HOST_DIR/drivers.nix" << DRIVERSNIX
{ ... }:
{
  drivers.nvidia.enable = ${enable_nvidia};
  drivers.amdgpu.enable = ${enable_amd};
  drivers.intel.enable = ${enable_intel};
  drivers.nvidia-prime.enable = ${enable_prime};
  vm.guest-services.enable = false;
  system.isbuilder.enable = false;
}
DRIVERSNIX

# --- Generate packages.nix ---
cat > "$HOST_DIR/packages.nix" << 'PACKAGESNIX'
{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  ];
}
PACKAGESNIX

# --- Generate default.nix ---
cat > "$HOST_DIR/default.nix" << DEFAULTNIX
{ profile, ... }:
{
  imports = [
    ./hardware.nix
    ./drivers.nix
    ./packages.nix
    ../../profiles/\${profile}
  ];
}
DEFAULTNIX

# --- Done ---
echo ""
echo "Generated hosts/${hostname}/ with:"
echo "  local.nix      - host-specific variables (profile: ${profile}, gui: ${gui})"
echo "  drivers.nix    - GPU/hardware driver settings"
echo "  packages.nix   - host-specific packages (empty, add as needed)"
echo "  default.nix    - imports everything + profile '${profile}'"
echo "  hardware.nix   - hardware configuration"
echo ""
echo "Next steps:"
echo "  1. Review and adjust hosts/${hostname}/local.nix and hosts/${hostname}/drivers.nix if needed"
echo "  2. Run: sudo nixos-rebuild switch --flake .#${hostname}"
