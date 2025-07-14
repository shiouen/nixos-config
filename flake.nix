{
    description = "NixOS systems and tools by shiouen";

    inputs = {
        # Pin our primary nixpkgs repository. This is the main nixpkgs repository
        # we'll use for our configurations. Be very careful changing this because
        # it'll impact your entire system.
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

        home-manager.url = "github:nix-community/home-manager/release-25.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { nixpkgs, home-manager, ... }: let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
    in {
        nixosConfigurations = {
            M1 = nixpkgs.lib.nixosSystem {
                inherit system;

                modules = [
                    home-manager.nixosModules.home-manager

                    ./hosts/M1/configuration.nix
                    ./home/nixos.nix
                ];
            };
        };
    };
}
