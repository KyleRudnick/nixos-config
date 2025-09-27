{
  lib,
  ...
}:
{
  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-config.cachix.org-1:Vd6raEuldeIZpttVQfrUbLvXJHzzzkS0pezXCVVjDG4="
    ];
  };
}
