{ ... }:
{
  drivers.nvidia.enable = false;
  drivers.amdgpu.enable = false;
  drivers.intel.enable = false;
  drivers.nvidia-prime.enable = false;
  vm.guest-services.enable = false;
  system.isbuilder.enable = false;
}
