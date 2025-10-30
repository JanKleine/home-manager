{
  programs.git = {
    enable = true;
    settings = {
      alias = {
        lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'";
      };
      # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
      pull.rebase = "true";
      init.defaultBranch = "main";
      merge.tool = "nvimdiff2";
      mergetool = {
          keepBackup = false;
          keepTemporaries = false;
      };
    };
  };
}
