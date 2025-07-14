{ pkgs, ... }:

{
  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Make user-level and system-wide packages available to Home Manager
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  # Pass on information about the user to Home Manager
  home-manager.users.olivier = {
    home.activation.createWorkspace = ''
      mkdir -p ~/workspace/code
    '';
    home.homeDirectory = "/home/olivier";
    home.stateVersion = "24.05";
    home.username = "olivier";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Configure user
  users.users.olivier = {
    description = "Olivier";
    home = "/home/olivier";
    isNormalUser = true;
    packages = with pkgs; [
      brave
      git
      jetbrains.idea-ultimate
      nixd
      python313
      zulu24
    ];
  };
}
