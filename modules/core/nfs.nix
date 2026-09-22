{ lib, config, ... }:
with lib;
let cfg = config.local.enableNFS; in
{
  options.local.enableNFS = mkEnableOption "NFS server";

  config = mkIf cfg {
    services.rpcbind.enable = true;
    services.nfs.server.enable = true;
  };
}
