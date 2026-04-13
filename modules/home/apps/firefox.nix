{ pkgs, inputs, ... }:
{
  home = {
    sessionVariables.BROWSER = "firefox";
  };
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
    };
    profiles.default = {
      name = "Default";
      search = {
        force = true;
        default = "ddg";
        order = [
          "ddg"
          "google"
        ];
      };
      bookmarks = {
        force = true;
        settings = [
          {
            name = "NixOS";
            url = "https://nixos.org/";
          }
          {
            name = "Nixpkgs";
            url = "https://search.nixos.org/packages?channel=unstable";
          }
          {
            name = "GitHub";
            url = "https://github.com/";
          }
          {
            name = "Home-manager";
            url = "https://nix-community.github.io/home-manager";
          }
          {
            name = "Wiki";
            url = "https://wiki.nixos.org/";
          }
          {
            name = "Arxiv";
            url = "https://arxiv.org/";
          }
        ];
      };
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        darkreader
        sponsorblock
        youtube-shorts-block
        clearurls
        ghostery
      ];
      settings = {
        "extensions.autoDisableScopes" = 0;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
      };
    };
  };
}
