{
  pkgs,
  inputs,
  config,
  ...
}:
{
  home = {
    sessionVariables.BROWSER = "firefox";
  };
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
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
      path = "default";
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
        clearurls
      ];
      settings = {
        "extensions.autoDisableScopes" = 0;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "browser.tabs.crash.Reporting.sendReport" = false;
        "browser.ping-centre.telemetry" = false;
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.enabled" = false;
        "browser.contentblocking.category" = "strict";
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.cryptomining.enabled" = true;
        "extensions.pocket.enabled" = false;
        "identity.fxaccounts.enabled" = false;
        "browser.ctrlTab.recentlyUsedOrder" = true;
        "browser.startup.page" = 3;
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "sidebar.visibility" = "expand-on-hover";
        "signon.rememberSignons" = false;
        "signon.autofillsForms" = false;
      };
    };
  };
}
