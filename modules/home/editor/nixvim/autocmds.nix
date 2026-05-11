{
  programs.nixvim.autoCmd = [
    {
      event =  "FileType" ;
      pattern = "tex";
      command = "highlight Conceal guifg=#d3d3d3 guibg=none";
    }
    {
      event =  "FileType";
      pattern = [
        "tex"
        "latex"
        "markdown"
      ];
      command = "setlocal spell spelllang=es,en";
    }
    {
      event = "TextYankPost";
      pattern = "*";
      command = "lua vim.highlight.on_yank{timeout=500}";
    }
  ];
}
