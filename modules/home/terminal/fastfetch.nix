{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        # source = "NixoOS";
        source = "~/Pictures/Nix/mem.png";
        padding.right = 1;
        printRemaining = true;
        position = "left";
      };

      display = {
        stat = false;
        showErrors = false;
        disableLinewrap = true;
        hideCursor = true;
        separator = " ";
        brightColor = false;
        key = {
          width = 12;
          type = "string";
        };
        size = {
          binaryPrefix = "iec";
        };
        temp = {
          unit = "C";
          ndigits = 2;
        };
        bar = {
          char = {
            elapsed = "█";
            total = "░";
          };
          border = {
            left = "";
            right = "";
          };
          width = 20;
        };
        percent = {
          type = 3;
          ndigits = 2;
        };
      };
      modules = [
        {
          type = "title";
          format = "{#38;2;239;128;152}┏━━━━━━━━━━━━━━━━━━━━ {user-name-colored} {#38;2;239;128;152}━━━━━━━━━━━━━━━━━━━━━┓";
          color = {
            user = "38;2;239;128;152";
            at = "38;2;239;128;152";
            host = "38;2;239;128;152";
          };
        }
        {
          type = "custom";
          format = "{#38;2;239;128;152}┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫";
        }
        # System Information
        {
          type = "os";
          key = "┃ {#keys}{#38;2;239;128;152} OS";
          keyColor = "38;2;239;128;152";
        }
        {
          type = "kernel";
          key = "┃ {#keys}{#38;2;239;128;152} Kernel";
          keyColor = "38;2;239;128;152";
        }
        {
          type = "uptime";
          key = "┃ {#keys}{#38;2;239;128;152} Uptime";
          keyColor = "38;2;239;128;152";
        }
        {
          type = "packages";
          key = "┃ {#keys}{#38;2;239;128;152}󰏖 Pkgs";
          keyColor = "38;2;239;128;152";
          format = "{all}";
        }
        {
          type = "custom";
          format = "{#38;2;239;128;152}┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫";
        }
        # Desktop Environment
        {
          type = "de";
          key = "┃ {#keys}{#38;2;239;128;152} DE";
          keyColor = "38;2;239;128;152";
        }
        {
          type = "wm";
          key = "┃ {#keys}{#38;2;239;128;152} WM";
          keyColor = "38;2;239;128;152";
        }
        {
          type = "shell";
          key = "┃ {#keys}{#38;2;239;128;152} Shell";
          keyColor = "38;2;239;128;152";
        }
        {
          type = "display";
          key = "┃ {#keys}{#38;2;239;128;152}󰹑 Display";
          keyColor = "38;2;239;128;152";
        }
        {
          type = "custom";
          format = "{#38;2;239;128;152}┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫";
        }
        #Hardware Information
        {
          type = "cpu";
          key = "┃ {#keys}{#38;2;239;128;152} CPU";
          format = "{name} @ {freq-max} │ {3}°C";
          keyColor = "38;2;239;128;152";
          temp = true;
        }
        {
          type = "cpuusage";
          key = "┃ {#keys}{#38;2;239;128;152}󰓅 Usage";
          keyColor = "38;2;239;128;152";
        }
        {
          type = "gpu";
          key = "┃ {#keys}{#38;2;239;128;152}󰾲 GPU";
          format = "{2} | {4}";
          temp = true;
          keyColor = "38;2;239;128;152";
        }
        {
          type = "memory";
          key = "┃ {#keys}{#38;2;239;128;152} Memory";
          format = "{used} / {total}";
          keyColor = "38;2;239;128;152";
        }
        {
          type = "physicaldisk";
          key = "┃ {#keys}{#38;2;239;128;152}󰋊 Drive";
          keyColor = "38;2;239;128;152";
          temp = true;
        }
        {
          type = "disk";
          key = "┃ {#keys}{#38;2;239;128;152}󱁼 Disk";
          keyColor = "38;2;239;128;152";
          format = "{1} / {2} ({3}) - {9}";
        }
        {
          type = "custom";
          format = "{#38;2;239;128;152}┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫";
        }
        {
          type = "colors";
          key = "┃        ";
          symbol = "circle";
          keyColor = "38;2;239;128;152";
        }
        {
          type = "custom";
          format = "{#38;2;239;128;152}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛";
        }
      ];
    };
  };
}
