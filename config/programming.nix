{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    go
    (python312Full.withPackages(p: with p; [ numpy ]))
    clang
  ];
}
