{ ... }:

{
  # Uncomment to Enable X11 
  # if not, only use Wayland
  # services.xserver.enable = true; 

  # enable KDE Plasma
  services.displayManager.sddm.enable = true; 
  services.desktopManager.plasma6.enable = true; 

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us"; 
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true; 

  # Enable sound with pipewire. 
  services.pulseaudio.enable = false;
  security.rtkit.enable = true; 
  services.pipewire = {
    enable = true; 
    alsa.enable = true; 
    alsa.support32Bit = true; 
    pulse.enable = true; 

    # uncomment to use JACK applications
    #jack.enable = true; 

    # use the example session manager (no others are packaged yet so this is enabled by default, 
    # no need to redefine it in your config for now)
    #media-session.enable = true; 
  };

  # Enable touchpad support (enabled by default in most desktopManager)
  # services.xserver.libinput.enable = true;
}
