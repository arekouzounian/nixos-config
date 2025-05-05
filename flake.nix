{
  description = "NixOS Tower Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; 
  };

  outputs = { nixpkgs, ... } @ inputs: 
  {
    nixosConfigurations.nixos-tower = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
	./hardware-configuration.nix
	./nvidia.nix
        ./users.nix 
        ./sys-packages.nix
        ./internationalization.nix 
        ./program-conf.nix
        ./gc.nix
	./services.nix
      ];
    };
  };
}
