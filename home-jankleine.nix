{ pkgs, ... }:
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

  imports = [
    ./configs
    ./programs
    ./programs/ssh-private.nix
  ];

  home.packages = with pkgs; [
    gh
    inetutils  # telnet and the likes
    rustup
    tree
  ];

  programs.git.settings.user = {
    name = "Jan Kleine";
    email = "janpaulkleine@icloud.com";
  };
}
