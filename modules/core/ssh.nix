{ lib, config, ... }:
with lib;
let
  cfg = config.system.sshserver;
in
{
  options.system.sshserver = {
    enable = mkEnableOption "Enable SSH Server";
  };

  # Services to start
  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;

      hostKeys = [
        {
          type = "ed25519";
          path = "/etc/ssh/ssh_host_ed25519_key";
        }
      ];
    };
  };

}
