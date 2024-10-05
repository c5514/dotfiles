{pkgs,...}:
{
	programs.fastfetch = {
		enable = true;
		settings = {
    logo= {
        source = "NixOS";
        padding.right = 1;
        printRemaining = true;
        position = "left";
    };
    general.multithreading = true;
    display = {
        stat = false;
        showErrors = false;
        disableLinewrap = true;
        hideCursor = true;
        separator = "";
        brightColor = false;
        key = {
            width = 20;
            type = "string";
        };
        size = {
            binaryPrefix = "iec";
            ndigits = "2";
        };
        temp = {
            unit = "C";
            ndigits = 2;
            color = {
                "green" = "\u001b[38;2;0;255;0";
                "yellow" = "\u001b[1;38;2;255;255;0";
                "red" = "\u001b[1;38;2;255;0;0";
            };
        };
        bar = {
            charElapsed = "=";
            charTotal = "-";
            border = false;
            width = 30;
        };
        percent = {
            type = 3;
            ndigits = 2;
            color = {
                "green" = "\u001b[38;2;0;255;0";
                "yellow" = "\u001b[1;38;2;255;255;0";
                "red"= "\u001b[1;38;2;255;0;0";
            };
        };
    };
    modules = [
        {
            type = "title";
            key = "󰶫 Account";
            keyColor = "\u001b[38;2;255;128;255";
            format = "{1}@{2}";
        }
        {
            type = "player";
            key = "  󰥠 Player";
            keyColor = "\u001b[38;2;255;128;255";
        }
        {
            type = "media";
            key = "   Media";
            keyColor = "\u001b[38;2;255;128;255";
            format = "{1} - {3}";
        }
        {
            type = "os";
            key = " os";
            keyColor = "\u001b[38;2;0;192;255";
        }
        {
            type = "kernel";
            key = "   Kernel";
            keyColor = "\u001b[38;2;0;192;255";
            format = "{2} {4}";
        }
        {
            type = "packages";
            key = "  󰏖 Packages";
            keyColor = "\u001b[38;2;0;192;255";
        }
        {
            type= "uptime";
            key = "   Uptime";
            keyColor = "\u001b[38;2;0;192;255";
        }
        {
            type = "terminal";
            key = "   Terminal";
            keyColor = "\u001b[38;2;0;192;255";
        	format = "{5} (\u001b[0;38;2;0;255;0m{6}\u001b[0m)";
        }
        {
            type = "terminalsize";
            key = "    󰲎 TerminalSize";
            keyColor = "\u001b[38;2;0;192;255";
        }
        {
            type = "terminalfont";
            key = "     TerminalFont";
            keyColor = "\u001b[38;2;0;192;255";
        }
        {
            type = "shell";
            key = "     Shell";
            keyColor = "\u001b[38;2;0;192;255";
            format = "{6} (\u001b[0;38;2;0;255;0m{4}\u001b[0m)";
        }
        {
            type = "localip";
            key = "  󰩟 LocalIP";
            keyColor = "\u001b[38;2;0;192;255";
            showipv4 = true;
            showipv6 = true;
            compact = true;
        }
        {
            type = "publicip";
            key = "  󰩠 PublicIP";
            keyColor = "\u001b[38;2;0;192;255";
        }
        {
            type = "locale";
            key = "   Locale";
            keyColor = "\u001b[38;2;0;192;255";
        }
        {
            type = "de";
            key = " DE";
            keyColor = "\u001b[38;2;255;175;0";
        }
        {
            type = "lm";
            key = "  󰧨 LM";
            keyColor = "\u001b[38;2;255;175;0";
        }
        {
            type = "wm";
            key = "   WM";
            keyColor = "\u001b[38;2;255;175;0";
        }
        {
            type = "theme";
            key = "  󰉼 Theme";
            keyColor = "\u001b[38;2;255;175;0";
        }
        {
            type = "icons";
            key = "   Icons";
            keyColor = "\u001b[38;2;255;175;0";
        }
        {
            type = "font";
            key = "   Font";
            keyColor = "\u001b[38;2;255;175;0";
        }
        {
            type = "cursor";
            key = "  󰆿 Cursor";
            keyColor = "\u001b[38;2;255;175;0";
        }
        {
            type = "wallpaper";
            key = "  󰸉 Wallpaper";
            keyColor = "\u001b[38;2;255;175;0";
        }
        {
            type = "custom";
            format = "󰾰 Computer";
            outputColor = "\u001b[38;2;0;255;175";
        }
        {
            type = "board";
            key = "   Board";
            keyColor = "\u001b[38;2;0;255;175";
        }
        {
            type = "bios";
            key = "     BIOS";
            keyColor = "\u001b[38;2;0;255;175";
            format = "{5} - {4} (\u001b[0;38;2;0;255;0m{2}\u001b[0m)";
        }
        {
            type = "cpu";
            key = "   CPU";
            keyColor = "\u001b[38;2;0;255;175";
            temp = true;
        }
        {
            type = "cpuusage";
            key = "    󰓅 Usage";
            keyColor = "\u001b[38;2;0;255;175";
        }
        {
            type = "gpu";
            key = "  󰾲 GPU";
            keyColor = "\u001b[38;2;0;255;175";
            format = "{1} {2} - {3} {4}";
            temp = true;
        }
        {
            type = "memory";
            key = "   Memory";
            keyColor = "\u001b[38;2;0;255;175";
        }
        {
            type = "battery";
            key = "   Battery";
            keyColor = "\u001b[38;2;0;255;175";
            temp = true;
        }
        {
            type= "swap";
            key= "  󰓡 Swap";
            keyColor= "\u001b[38;2;0;255;175";
        }
        {
            type = "custom";
            format = "   PhysicalDisk";
            outputColor= "\u001b[38;2;0;255;175";
        }
        {
            type = "physicaldisk";
            key = "    󰋊 Drive";
            keyColor= "\u001b[38;2;0;255;175";
            format= "[\u001b[38;2;0;192;255m{3}\u001b[0m|\u001b[38;2;0;192;255m{4}\u001b[0m]{2} [\u001b[38;2;255;0;255m{7}\u001b[0m|\u001b[38;2;255;0;255m{8}\u001b[0m] (\u001b[38;2;0;255;0m{1}\u001b[0m) - \u001b[38;2;255;255;0m{5}\u001b[0m";
            temp= true;
        }
        {
            type= "custom";
            format= "  󰪶 MountedFileSystems";
            outputColor= "\u001b[38;2;0;255;175";
        }
        {
            type= "disk";
            key= "    󱁼 FileSystem";
            keyColor= "\u001b[38;2;0;255;175";
        }
        {
            type = "bluetooth";
            key = "  󰂯 Bluetooth";
            keyColor = "\u001b[38;2;0;255;175";
        }
        {
            type= "monitor";
            key= "  󰹑 Monitor";
            keyColor= "\u001b[38;2;0;255;175";
        }
        {
            type= "brightness";
            key= "    󰃠 Brightness";
            keyColor= "\u001b[38;2;0;255;175";
        }
    ];
};
	};
}
