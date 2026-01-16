{ pkgs, ... }:
{
    programs.ssh = {
        enable = true;
        package = pkgs.openssh;
        enableDefaultConfig = false;
        matchBlocks = {
            "debian" = {
                hostname = "jankleine.de";
                user = "jan";
                port = 22203;
                addKeysToAgent = "yes";
                forwardAgent = true;
            };
            "docker" = {
                hostname = "jankleine.de";
                user = "host";
                addKeysToAgent = "yes";
                forwardAgent = true;
            };
        };
    };

    services.ssh-agent = {
        enable = true;
        enableZshIntegration = true;
    };

    programs.zsh.initContent = ''
        ssh-add ~/.ssh/id_ed25519_sk_rk_yubikey-1 2>/dev/null || true
        ssh-add ~/.ssh/id_ed25519_sk_rk_yubikey-2 2>/dev/null || true
    '';

}
