{ gui, ... }:
{
  imports = [
    ./core
  ] ++ (if gui != "none" then [
    ./gui
  ] else []);
}
