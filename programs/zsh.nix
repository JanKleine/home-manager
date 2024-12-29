{ config, pkgs, ... }:
let
  xdg = config.xdg;
in
{
  xdg.enable = true;

  home.file = {
    # Disable generation of .zshenv in home directory. ZDOTDIR is set globally
    # in /etc/zshenv, which is managed by nix-darwin.
    ".zshenv".enable = false;

    # link additional config files
    ".config/zsh" = {
      source = ./zsh;
      recursive = true;
    };
  };

  home.sessionVariables = {
    # XDG Config
    DOCKER_CONFIG="${xdg.configHome}/docker";

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

  programs.zsh = {
    enable = true;
    completionInit = "autoload -U compinit && compinit -u";
    # ditDir is relative to the home directory so don't use ${xdg...}
    dotDir = ".config/zsh";
    history = {
      extended = true;
      path = "${xdg.dataHome}/zsh/zsh_history";
      save = 100000;
      size = 100000;
    };
    initExtra = ''
      source ${xdg.configHome}/zsh/powerlevel10k/powerlevel10k.zsh-theme
      source ${xdg.configHome}/zsh/.p10k.zsh
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
}
