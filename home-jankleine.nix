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
    pkgs.inetutils  # telnet and the likes
    pkgs.rustup
  ];

  home.file = {
    # Disable generation of .zshenv in home directory. ZDOTDIR is set globally
    # in /etc/zshenv, which is managed by nix-darwin.
    ".zshenv".enable = false;
  };

  home.sessionVariables = {
    # XDG Data
    AZURE_CONFIG_DIR = "${xdg.dataHome}/azure";
    CARGO_HOME = "${xdg.dataHome}/cargo";
    GNUPGHOME = "${xdg.dataHome}/gnupg";
    GRADLE_USER_HOME = "${xdg.dataHome}/gradle";
    LEIN_HOME = "${xdg.dataHome}/lein";
    LESSHISTFILE = "${xdg.dataHome}/lesshst";
    RUSTUP_HOME = "${xdg.dataHome}/rustup";
    TASKDATA = "${xdg.dataHome}/task";
    VAGRANT_ALIAS_FILE = "${xdg.dataHome}/vagrant/aliases";
    VAGRANT_HOME = "${xdg.dataHome}/vagrant";
    VSCODE_EXTENSIONS = "${xdg.dataHome}/vscode/extensions";
    _Z_DATA = "${xdg.dataHome}/z/z";
  };

  home.shellAliases = {
    ".." = "cd ..";
    "ll" = "ls -lahp --color=auto";
    "hm" = "home-manager";
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
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "brackets"
      ];
    };
    plugins = [
      {
        # adds z command for convenient directory switching
        name = "zsh-z";
        src = pkgs.fetchFromGitHub {
          owner = "agkozak";
          repo = "zsh-z";
          rev = "afaf296";  # latest commit as of 2024-11-30
          hash = "sha256-FnGjp/VJLPR6FaODY0GtCwcsTYA4d6D8a6dMmNpXQ+g=";
        };
      }
    ];
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  programs.fzf.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
