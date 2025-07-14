{ pkgs, ... }:

{
  imports = [
      ./base.nix
  ];

  users.users.olivier = {
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
