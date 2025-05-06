{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    neovim
    vscode 
    alacritty
    gh
  ];
}
