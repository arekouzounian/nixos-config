{ pkgs, config, libs, ... }: 

{
  hardware.graphics = {
    enable = true; 
  }; 

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true; 

    # experimental, buggy
    powerManagement.enable = false; 

    # also experimental, turn off GPU when not in use
    powerManagement.finegrained = false; 

    open = true; 
    nvidiaSettings = true; 

    package = config.boot.kernelPackages.nvidiaPackages.production;

#    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
#      version = "570.144";
#      sha256_64bit = "sha256-wLjX7PLiC4N2dnS6uP7k0TI9xVWAJ02Ok0Y16JVfO+Y=";
#      sha256_aarch64 = "sha256-6kk2NLeKvG88QH7/YIrDXW4sgl324ddlAyTybvb0BP0=";
#      openSha256 = "sha256-PATw6u6JjybD2OodqbKrvKdkkCFQPMNPjrVYnAZhK/E=";
#      settingsSha256 = "sha256-VcCa3P/v3tDRzDgaY+hLrQSwswvNhsm93anmOhUymvM=";
#      persistencedSha256 = "sha256-hx4w4NkJ0kN7dkKDiSOsdJxj9+NZwRsZEuhqJ5Rq3nM=";
#    };
  };
}
