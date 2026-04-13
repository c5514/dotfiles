{ pkgs, ... }:
{
  programs.zathura = {
    enable = true;
    package = pkgs.zathura;
    options = {
      adjust-open = "best-fit";
      pages-per-row = "1";
      synctex = true;
      zoom-min = "10";
      font = "JetBrainsMono 12";

      default-bg = "rgba(0,0,0,0.4)";
      default-fg = "#F7F7F6";

      selection-notification = true;
      selection-clipboard = "clipboard";

      scroll-page-aware = "true";
      scroll-full-overlap = "0.01";
      scroll-step = "50";
      render-loading = "false";
    };
  };
}
