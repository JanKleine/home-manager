{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./neovim.nix
    ./zsh.nix
  ];

  # allow non FOSS packages
  nixpkgs.config.allowUnfree = true;

  # default nix packages
  home.packages = with pkgs; [
    claude-code
    colima
    devbox
    docker
    git-crypt
    ripgrep
    rsync
    unixtools.watch
  ];

  # additional packages without more configuration
  programs.bat.enable = true;
  programs.btop.enable = true;
  programs.fzf.enable = true;
  programs.difftastic = {
    enable = true;
    git.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
