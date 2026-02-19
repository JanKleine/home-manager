{ lib, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      alias = {
        lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'";
      };
      # Sign all commits using ssh key
      commit.gpgsign = true;
      tag.forceSignAnnotated = true;
      gpg.format = "ssh";
      # allow to be overwritten in user config
      user.signingkey = lib.mkDefault "~/.ssh/id_ed25519_sk_rk_yubikey-1.pub";
      pull.rebase = "true";
      push.autoSetupRemote = "true";
      init.defaultBranch = "main";
      merge.tool = "nvimdiff2";
      mergetool = {
          keepBackup = false;
          keepTemporaries = false;
      };
    };
  };
}
