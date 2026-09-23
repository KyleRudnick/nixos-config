{ config, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks."github.com" = {
      # identityFile = config.sops.secrets."github_access_key".path;
      user = "git";
    };
  };

  home.sessionVariables = {
    # OPENROUTER_API_KEY = "$(cat ${config.sops.secrets.OPENROUTER_API_KEY.path})";
    # OPENCODE_ZEN_GO_API_KEY = "$(cat ${config.sops.secrets.OPENCODE_ZEN_GO_API_KEY.path})";
  };
}
