sudo cp /etc/nixos/*.nix config
sudo cp /etc/nixos/flake.lock config

cp ~/.config/home-manager/* home-manager/

sudo chown $USER config/*.*
