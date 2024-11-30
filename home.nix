{ config, pkgs, ... }:
let
  xdg = config.xdg;
in
{
  home.username = "jankleine";
  home.homeDirectory = "/Users/jankleine";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
  ];

  home.file = {
    # Disable generation of .zshenv in home directory. ZDOTDIR is set globally
    # in /etc/zshenv, which is managed by nix-darwin.
    ".zshenv".enable = false;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    ".." = "cd ..";
    "ll" = "ls -lahp --color=auto";
    vim = "nvim";
  };

  xdg.enable = true;

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    history = {
      extended = true;
      path = "${xdg.dataHome}/zsh/zsh_history";
      save = 100000;
      size = 100000;
    };
    initExtra = ''
      source ${xdg.configHome}/home-manager/zsh/powerlevel10k/powerlevel10k.zsh-theme
      source ${xdg.configHome}/home-manager/zsh/.p10k.zsh
    '';
  };

  programs.fzf.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
