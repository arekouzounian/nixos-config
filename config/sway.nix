# https://nixos.wiki/wiki/Sway
{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    grim # screenshots 
    slurp # screenshots
    wl-clipboard # copy-paste 
    mako # notification system 
    swaybg
    # wofi # launcher 
  ];

  # Enable the gnome-keyring secrets vault 
  # not sure if this is necessary? 
  services.gnome.gnome-keyring.enable = true; 

  programs.sway = {
    enable = true; 
    wrapperFeatures.gtk = true; 
  };
}
