{
    programs.ssh = {
        enable = true;
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
}
