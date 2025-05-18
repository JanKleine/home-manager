{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./neovim.nix
    ./zsh.nix
  ];

  # default nix packages
  home.packages = with pkgs; [
    colima
    docker
    unixtools.watch
  ];

  # additional packages without more configuration
  programs.bat.enable = true;
  programs.btop.enable = true;
  programs.fzf.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
