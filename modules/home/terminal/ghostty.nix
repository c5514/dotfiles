{ inputs, pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      font-family = "JetBrains Mono";
      font-size = 14;
      theme = "Dark+";
      background = "0c090a";
      copy-on-select = "clipboard";
      mouse-hide-while-typing = true;
      cursor-style = "bar";
      window-decoration = false;
      focus-follows-mouse = false;
      keybind = [
        "shift+alt+h=new_split:left"
        "shift+alt+j=new_split:down"
        "shift+alt+l=new_split:right"
        "shift+alt+k=new_split:up"
        "alt+h=goto_split:left"
        "alt+j=goto_split:bottom"
        "alt+l=goto_split:right"
        "alt+k=goto_split:top"
        "ctrl+alt+h=resize_split:left,10"
        "ctrl+alt+j=resize_split:down,10"
        "ctrl+alt+l=resize_split:right,10"
        "ctrl+alt+k=resize_split:up,10"
        "ctrl+shift+n=new_window"
        "ctrl+shift+t=new_tab"
        "ctrl+tab=next_tab"
        "ctrl+shift+tab=previous_tab"
        "ctrl+shift+d=close_window"
        "ctrl+alt+d=close_tab"
        "ctrl+shift+f=toggle_maximize"
        "ctrl+alt+f=toggle_fullscreen"
      ];
      command = "fish --login --interactive";
    };
  };
}
