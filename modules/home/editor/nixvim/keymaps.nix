{
  programs.nixvim.keymaps = [
    {
      key = ";";
      action = ":";
      mode = "n";
    }
    {
      key = "jk";
      action = "<Esc>";
      mode = "i";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>/";
      action = "<Cmd>nohl<CR>";
      mode = "n";
      options = {
        desc = "Clear search";
      };
    }
    {
      key = "<C-d>";
      action = "<C-d>zz";
      mode = "n";
      options = {
        desc = "Allow C-d to keep cursor in the middle";
      };
    }
    {
      key = "<C-u>";
      action = "<C-u>zz";
      mode = "n";
      options = {
        desc = "Allow C-u to keep cursor in the middle";
      };
    }
    {
      key = "n";
      action = "nzzzv";
      mode = "n";
      options = {
        desc = "Allow search terms to stay in the middle";
      };
    }
    {
      key = "N";
      action = "Nzzzv";
      mode = "n";
      options = {
        desc = "Allow search terms to stay in the middle";
      };
    }
    {
      key = "<leader>w";
      action = "window";
      mode = "n";
      options = {
        desc = "Allow search terms to stay in the middle";
      };
    }
    {
      key = "<leader>w-";
      action = "<C-W>s";
      mode = "n";
      options = {
        desc = "Split window below";
      };
    }
    {
      key = "<leader>w|";
      action = "<C-W>v";
      mode = "n";
      options = {
        desc = "Split window right";
      };
    }
    {
      key = "<C-h>";
      action = "<C-W>h";
      mode = "n";
      options = {
        desc = "Move to window left";
      };
    }
    {
      key = "<C-l>";
      action = "<C-W>l";
      mode = "n";
      options = {
        desc = "Move to window right";
      };
    }
    {
      key = "<C-k>";
      action = "<C-W>k";
      mode = "n";
      options = {
        desc = "Move to window above";
      };
    }
    {
      key = "<C-j>";
      action = "<C-W>j";
      mode = "n";
      options = {
        desc = "Move to window below";
      };
    }
  ];
}
