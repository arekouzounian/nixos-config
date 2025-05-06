{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # official client. may not be working
    #pkgs.minecraft
    pkgs.prismlauncher
  ];
}
