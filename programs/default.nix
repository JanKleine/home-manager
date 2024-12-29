{
  imports = [
    ./git.nix
    ./neovim.nix
    ./zsh.nix
  ];

  # Simple program definitions
  programs.fzf.enable = true;
  programs.bat.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
