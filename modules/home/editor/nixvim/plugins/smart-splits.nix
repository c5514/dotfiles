{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.nixvim = {
    plugins.smart-splits.enable = true;
    keymaps = lib.mkIf config.programs.nixvim.plugins.smart-splits.enable [
      {
        mode = "n";
        key = "<A-h>";
        action.__raw = "require('smart-splits').resize_left";
      }
      {
        mode = "n";
        key = "<A-j>";
        action.__raw = "require('smart-splits').resize_down";
      }
      {
        mode = "n";
        key = "<A-k>";
        action.__raw = "require('smart-splits').resize_up";
      }
      {
        mode = "n";
        key = "<A-l>";
        action.__raw = "require('smart-splits').resize_right";
      }
      {
        mode = "n";
        key = "<C-h>";
        action.__raw = "require('smart-splits').move_cursor_left";
      }
      {
        mode = "n";
        key = "<C-j>";
        action.__raw = "require('smart-splits').move_cursor_down";
      }
      {
        mode = "n";
        key = "<C-k>";
        action.__raw = "require('smart-splits').move_cursor_up";
      }
      {
        mode = "n";
        key = "<C-l>";
        action.__raw = "require('smart-splits').move_cursor_right";
      }
      {
        mode = "n";
        key = "<C-\\>";
        action.__raw = "require('smart-splits').move_cursor_previous";
      }
      {
        mode = "n";
        key = "<leader><leader>h";
        action.__raw = "require('smart-splits').swap_buf_left";
      }
      {
        mode = "n";
        key = "<leader><leader>j";
        action.__raw = "require('smart-splits').swap_buf_down";
      }
      {
        mode = "n";
        key = "<leader><leader>k";
        action.__raw = "require('smart-splits').swap_buf_up";
      }
      {
        mode = "n";
        key = "<leader><leader>l";
        action.__raw = "require('smart-splits').swap_buf_right";
      }
    ];
  };
}
