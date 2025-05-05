{ ... }:

{
  programs.firefox.enable = true; 

  programs._1password.enable = true; 
  programs._1password-gui = {
    enable = true; 
    
    # might be unnecessary
    polkitPolicyOwners = [ "arek" ];
  };

  programs.steam = {
    enable = true; 
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true; 
    localNetworkGameTransfers.openFirewall = true;
  };
}
