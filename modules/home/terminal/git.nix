{ pkgs, ... }:
{
  programs = {
    gh.enable = true;
    lazygit.enable = true;
    git = {
      enable = true;
      settings = {
        user = {
          name = "c5514";
          email = "c5514@c5514.com";
        };
        init.defaultBranch = "main";
        core.editor = "nvim";
        github.user = "c5514";
      };
    };
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings."*" = {
        forwardAgent = false;
        addKeysToAgent = "yes";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
      };
    };
  };
  services.ssh-agent.enable = true;
}
