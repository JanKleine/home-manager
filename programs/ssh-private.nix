{ pkgs, ... }:
{
    programs.ssh.settings = {
        "debian" = {
            HostName = "jankleine.de";
            User = "jan";
            Port = 22203;
            AddKeysToAgent = "yes";
            ForwardAgent = true;
        };
        "docker" = {
            HostName = "jankleine.de";
            User = "host";
            AddKeysToAgent = "yes";
            ForwardAgent = true;
        };
    };
}
