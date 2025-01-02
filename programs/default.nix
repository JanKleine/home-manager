{
  imports = [
    ./git.nix
    ./neovim.nix
    ./zsh.nix
  ];

  # additional packages without more configuration
  programs.bat.enable = true;
  programs.fzf.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
