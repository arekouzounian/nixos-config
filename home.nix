{ config, pkgs, ... }: 

{
	home.username = "arek"; 
	home.homeDirectory = "/home/arek"; 

	# The home manager release that your config is compatible with.
	# Even if you update, you shouldn't change this value. 
	home.stateVersion = "24.11"; 

	# Install any extra packages here 
	home.packages = [

	# Here you can add overrides: 
	# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

	# You can also create shell scripts directly in the config: 
	# (pkgs.writeShellScriptBin "my-hello" ''
	#	echo "Hello, ${config.home.username}!"
	# '')
	]; 

	# dot files can be managed directly here
	home.file = {
	};

	# environment variables can be set here
	# The alternative is to manually source 'hm-session-vars.sh'
	# at one of the following: 
	#	~/.nix-profile/etc/profile.d/hm-session-vars.sh 
	#	~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh 
	#	/etc/profiles/per-user/<USER NAME>/etc/profile.d/hm-session-vars.sh
	home.sessionVariables = {
		EDITOR = "nvim"; 	
	};


	# let home manager manage itself
	programs.home-manager.enable = true; 

	# Individual configs below
	programs.bash = {
		enable = true; 
		shellAliases = {
			ll = "ls -lah"; 
			ccnix = "sudo $EDITOR /etc/nixos/configuration.nix"; 
			ccflake = "sudo $EDITOR /etc/nixos/flake.nix"; 
			cchome = "sudo $EDITOR /etc/nixos/home.nix"; 
			bflake = "sudo nixos-rebuild switch --flake /etc/nixos/#arek"; 

			# git aliases 
			gst = "git status"; 
			gcm = "git commit -m"; 
			gd = "git diff";

		}; 
	}; 

	programs.alacritty = {
		enable = true; 
		settings = {
			general = {
				working_directory = "/home/arek"; 
				live_config_reload = true; 
			}; 

			window = {
				opacity = 0.8; 
				blur = true; 
				title = "sudocomprehensible"; 
				padding.x = 10; 
				padding.y = 5; 
				dynamic_padding = true; 
			}; 

			colors.primary.foreground = "#0bd092";
		}; 
	}; 
}


