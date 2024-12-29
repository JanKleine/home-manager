{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./neovim.nix
    ./zsh.nix
  ];

  # additional packages without more configuration
  home.packages = with pkgs; [
    bat
    fzf
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
