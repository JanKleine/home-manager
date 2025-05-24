{ pkgs, ... }:
{
  home.username = "ipt";
  home.homeDirectory = "/Users/ipt";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./configs
    ./programs
  ];

  home.packages = with pkgs; [
    k9s
    pre-commit
    timewarrior
  ];

  programs.git = {
    userName = "Jan Kleine";
    userEmail = "jan.kleine@ipt.ch";
  };
}
