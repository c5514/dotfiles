{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    opts = {
      clipboard = "unnamedplus";
      number = true;
      relativenumber = true;
      signcolumn = "yes";
      tabstop = 2;
      softtabstop = 2;
      showtabline = 0;
      expandtab = true;
      shiftwidth = 2;
      termguicolors = true;
      mouse = "a";
      smartindent = true;
      cursorline = true;
      swapfile = false;
      undofile = true;
      timeoutlen = 200;
      updatetime = 50;
      conceallevel = 2;
      encoding = "utf-8";
      fileencoding = "utf-8";
      ignorecase = true;
      smartcase = true;
      scrolloff = 8;
      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
      showmode = false;
      cmdheight = 0;
      wrap = true;
    };
  };
}
