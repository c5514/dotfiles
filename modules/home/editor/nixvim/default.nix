{
  imports = [
    ./plugins/default.nix
    ./autocmds.nix
    ./keymaps.nix
    ./options.nix
  ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    colorschemes.onedark = {
      enable = true;
      settings = {
        style = "warmer";
        colors.bg0 = "#0d1117";
        lualine.transparent = false;
      };
    };
  };
}
