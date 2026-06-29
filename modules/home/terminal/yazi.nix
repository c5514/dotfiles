{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableFishIntegration = true;
    settings = {
      mgr = {
        show_hidden = false;
        sort_by = "mtime";
        sort_dir_first = true;
        sort_reverse = true;
      };
    };
    theme = {
      mgr = {
        cwd = {
          fg = "#61AFEF";
        };
        find_keyword = {
          fg = "#E06C75";
          italic = true;
          underline = true;
        };
        find_position = {
          fg = "#E5C07B";
          italic = true;
        };
        marker_copied = {
          fg = "#ABB2BF";
          bg = "#98C379";
        };
        marker_cut = {
          fg = "#ABB2BF";
          bg = "#E06C75";
        };
        marker_marked = {
          fg = "#ABB2BF";
          bg = "#56B6C2";
        };
        marker_selected = {
          fg = "#ABB2BF";
          bg = "#E5C07B";
        };
        count_copied = {
          fg = "#98C379";
          bg = "#282C34";
        };
        count_cut = {
          fg = "#E06C75";
          bg = "#282C34";
        };
        count_selected = {
          fg = "#98C379";
          bg = "#282C34";
        };
        border_symbol = "│";
        border_style = {
          fg = "#282C34";
        };
      };
      indicator = {
        current = {
          bg = "#282C34";
        };
        preview = {
          underline = true;
        };
      };
      tabs = {
        active = {
          bg = "#282C34";
          fg = "#61AFEF";
        };
      };
      mode = {
        normal_main = {
          fg = "#282C34";
          bg = "#61AFEF";
          bold = true;
        };
        normal_alt = {
          fg = "#61AFEF";
          bg = "#282C34";
        };
        select_main = {
          fg = "#282C34";
          bg = "#61AFEF";
          bold = true;
        };
        select_alt = {
          fg = "#61AFEF";
          bg = "#282C34";
        };
        unset_main = {
          fg = "#282C34";
          bg = "#61AFEF";
          bold = true;
        };
        unset_alt = {
          fg = "#61AFEF";
          bg = "#282C34";
        };
      };
      status = {
        sep_left = {
          open = "";
          close = "";
        };
        sep_right = {
          open = "";
          close = "";
        };
        progress_label = {
          fg = "#ABB2BF";
          bold = true;
        };
        progress_normal = {
          fg = "#98C379";
          bg = "#282C34";
        };
        progress_error = {
          fg = "#E06C75";
          bg = "#282C34";
        };
        perm_type = {
          fg = "#98C379";
        };
        perm_read = {
          fg = "#E06C75";
        };
        perm_write = {
          fg = "#E5C07B";
        };
        perm_exec = {
          fg = "#98C379";
        };
        perm_sep = {
          fg = "#ABB2BF";
        };
      };
      pick = {
        border = {
          fg = "#98C379";
        };
        active = {
          fg = "#E5C07B";
          bold = true;
        };
      };
      input = {
        border = {
          fg = "#98C379";
        };
        selected.reversed = true;
      };
      cmp.border = {
        fg = "#98C379";
      };
      tasks = {
        border = {
          fg = "#98C379";
        };
        hovered = {
          fg = "#E5C07B";
          underline = true;
        };
      };
      which = {
        mask = {
          bg = "#282C34";
        };
        cand = {
          fg = "#98C379";
        };
        rest = {
          fg = "#ABB2BF";
        };
        desc = {
          fg = "#E5C07B";
        };
        separator = "  ";
        separator_style = {
          fg = "#ABB2BF";
        };
      };
      help = {
        on = {
          fg = "#98C379";
        };
        run = {
          fg = "#E5C07B";
        };
        hovered = {
          reversed = true;
          bold = true;
        };
        footer = {
          fg = "#ABB2BF";
          bg = "#000000";
        };
      };
      notify = {
        title_info = {
          fg = "#98C379";
        };
        title_warn = {
          fg = "#E06C75";
        };
        title_error = {
          fg = "#E5C07B";
        };
      };
      filetype = {
        rules = [
          # Images
          {
            mime = "image/*";
            fg = "#E5C07B";
          }
          # Media
          {
            mime = "video/*";
            fg = "#E06C75";
          }
          {
            mime = "audio/*";
            fg = "#E06C75";
          }
          # Archives
          {
            mime = "application/zip";
            fg = "#C678DD";
          }
          {
            mime = "application/x-tar";
            fg = "#C678DD";
          }
          {
            mime = "application/x-bzip*";
            fg = "#C678DD";
          }
          {
            mime = "application/x-bzip2";
            fg = "#C678DD";
          }
          {
            mime = "application/x-7z-compressed";
            fg = "#C678DD";
          }
          {
            mime = "application/x-rar";
            fg = "#C678DD";
          }
          {
            mime = "application/x-xz";
            fg = "#C678DD";
          }
          # Documents
          {
            mime = "application/doc";
            fg = "#D3D3D3";
          }
          {
            mime = "application/pdf";
            fg = "#D3D3D3";
          }
          {
            mime = "application/rtf";
            fg = "#D3D3D3";
          }
          {
            mime = "application/vnd.*";
            fg = "#D3D3D3";
          }
          # Fallback
          {
            url = "*";
            fg = "#ABB2BF";
          }
          {
            url = "*/";
            fg = "#61AFEF";
          }
        ];
      };
    };
  };
}
