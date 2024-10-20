{pkgs,...}:
{
	programs.fastfetch = {
		enable = true;
		settings = {
    logo= {
        source = "NixoOS";
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
        };
    };
    modules = [
		{
    		"type" =  "title";
    		"format" = "{#1}╭───────────── {#}{user-name-colored}";
		}
        # {
        #     type = "title";
        #     key = "󰶫 Account";
        #     format = "{1}@{2}";
        # }
        {
            type = "os";
            key = " os";
        }
        {
            type = "kernel";
            key = "   Kernel";
        }
        {
            type = "packages";
            key = "  󰏖 Packages";
        }
        {
            type= "uptime";
            key = "   Uptime";
        }
        {
            type = "terminal";
            key = "   Terminal";
        }
        {
            type = "terminalsize";
            key = "    󰲎 TerminalSize";
        }
        {
            type = "terminalfont";
            key = "     TerminalFont";
        }
        {
            type = "shell";
            key = "     Shell";
        }
        {
            type = "localip";
            key = "  󰩟 LocalIP";
            showipv4 = true;
            showipv6 = true;
            compact = true;
        }
        {
            type = "publicip";
            key = "  󰩠 PublicIP";
        }
        {
            type = "locale";
            key = "   Locale";
        }
        {
            type = "de";
            key = " DE";
        }
        {
            type = "lm";
            key = "  󰧨 LM";
        }
        {
            type = "wm";
            key = "   WM";
        }
        {
            type = "theme";
            key = "  󰉼 Theme";
        }
        {
            type = "icons";
            key = "   Icons";
        }
        {
            type = "font";
            key = "   Font";
        }
        {
            type = "cursor";
            key = "  󰆿 Cursor";
        }
        {
            type = "wallpaper";
            key = "  󰸉 Wallpaper";
        }
        {
            type = "custom";
            format = "󰾰 Computer";
        }
        {
            type = "board";
            key = "   Board";
        }
        {
            type = "bios";
            key = "     BIOS";
        }
        {
            type = "cpu";
            key = "   CPU";
            temp = true;
        }
        {
            type = "cpuusage";
            key = "    󰓅 Usage";
        }
        {
            type = "gpu";
            key = "  󰾲 GPU";
            format = "{1} {2} - {3} {4}";
            temp = true;
        }
        {
            type = "memory";
            key = "   Memory";
        }
        {
            type = "battery";
            key = "   Battery";
            temp = true;
        }
        {
            type= "swap";
            key= "  󰓡 Swap";
        }
        {
            type = "physicaldisk";
            key = "    󰋊 Drive";
            temp= true;
        }
        {
            type= "disk";
            key= "    󱁼 FileSystem";
        }
        {
            type = "bluetooth";
            key = "  󰂯 Bluetooth";
        }
        {
            type= "monitor";
            key= "  󰹑 Monitor";
        }
        {
            type= "brightness";
            key= "    󰃠 Brightness";
        }
				{
    				"type"= "custom";
    				"format"= "{#1}╰───────────────────────────────╯";
				}
    	];
		};
	};
}
