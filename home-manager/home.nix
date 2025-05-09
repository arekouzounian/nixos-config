{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "arek";
  home.homeDirectory = "/home/arek";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    pkgs.nerd-fonts.ubuntu-mono

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/arek/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      # Misc.
      ll = "ls -lah";

      # Nix
      ccnix = "sudo $EDITOR /etc/nixos/configuration.nix";
      cchome = "$EDITOR $HOME/.config/home-manager/home.nix";
      bflake = "sudo nixos-rebuild switch --flake /etc/nixos#nixos-tower";
      bhome = "home-manager switch";

      # git
      gst = "git status";
      gcm = "git commit -m ";
      gd = "git diff";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        working_directory = "$HOME";
        live_config_reload = true;
      };

      window = {
        opacity = 0.75;
        blur = true;
        title = "sudocomprehensible";
        padding.x = 10;
        padding.y = 10;
        dynamic_padding = true;
      };

      font = {
        size = 12;

        normal = {
          family = "UbuntuMono Nerd Font";
          style = "Regular";
        };

        bold = {
          family = "UbuntuMono Nerd Font";
          style = "Bold";
        };

        italic = {
          family = "UbuntuMono Nerd Font";
          style = "Italic";
        };

        bold_italic = {
          family = "UbuntuMono Nerd Font";
          style = "Bold Italic";
        };
      };

      keyboard.bindings = [
        {
          key = "n";
          mods = "Control";
          action = "CreateNewWindow";
        }
        {
          key = "Enter";
          mods = "Control";
          action = "ToggleFullscreen";
        }
        {
          key = "q";
          mods = "Control";
          action = "Quit";
        }
      ];

      colors.primary.foreground = "#0bd092";

    };
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      format = ''
        ┌─$time $username@$hostname $python $git_branch $git_status 
        ├┤$directory│ ($cmd_duration)
        └\$> '';
      command_timeout = 750;

      time = {
        disabled = false;
        format = "[$time]($style)";
        style = "underline bold yellow";
      };

      python = {
        format = "[(\($virtualenv\))]($style)";
        style = "bold yellow";
      };

      username = {
        show_always = true;
        style_user = "bold";
        format = "[$user]($style)";
      };

      hostname = {
        ssh_only = false;
        format = "[$ssh_symbol$hostname]($style)";
        style = "bold italic cyan";
      };

      directory = {
        format = "[$path]($style)[$read_only]($read_only_style)";
        style = "bold blue";
        truncation_symbol = "🐙 ";
      };

      cmd_duration = {
        format = "took [$duration]($style)";
        style = "underline bold green";
      };

      git_metrics = {
        disabled = false;
      };
    };
  };

  # sway config
  # https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.sway.enable
  wayland.windowManager.sway =
    let
      resizeAmount = "20";
      wallpaperLoc = "/home/arek/Documents/wallpapers/nix-wallpaper-gear.png";
    in
    {
      enable = true;
      # might be the culprit if issues arise...
      extraOptions = [
        "--unsupported-gpu"
      ];

      config = rec {
        modifier = "Mod1";
        terminal = "alacritty";
        startup = [
          { command = "alacritty"; }
          { command = "firefox"; }
	  { command = "swaybg -i ${wallpaperLoc}"; }
        ];

        modes = {
          resize = {
            Return = "mode default";
            Escape = "mode default";
            Down = "resize grow height ${resizeAmount} px";
            Left = "resize shrink width ${resizeAmount} px";
            Right = "resize grow width ${resizeAmount} px";
            Up = "resize shrink height ${resizeAmount} px";

            j = "resize grow height ${resizeAmount} px";
            k = "resize shrink height ${resizeAmount} px";
            h = "resize shrink width ${resizeAmount} px";
            l = "resize grow width ${resizeAmount} px";
          };
        };
      };
    };
}
