{ pkgs, ... }:

{
  users.users.arek = {
    isNormalUser = true; 
    description = "arek"; 
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      discord-ptb 
      neofetch
      bat
    ];
  };
}
