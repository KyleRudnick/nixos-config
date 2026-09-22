{ gui, keyboardLayout, ... }:
{
  services.xserver = {
    enable = if gui == "pantheon" then true else false;
    xkb = {
      layout = keyboardLayout;
    };
  };
}
