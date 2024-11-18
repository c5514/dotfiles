{pkgs, lib,...}:

{
	home.file = {
		".config/wal/templates/colors-wlogout.css".source = ./colors-wlogout.css;
	};
	programs.wlogout = {
		enable = true;
		package = pkgs.wlogout;
		layout = [
			{
    			label = "lock";
    			action = "sleep 0.5 && swaylock";
    			text = "Lock";
    			keybind = "l";
			}
			{
    			label = "hibernate";
    			action = "sleep 1 && systemctl hibernate";
    			text = "Hibernate";
    			keybind = "h";
			}
			{
				label = "logout";
    			action = "sleep 0.5 && swaymsg exit && sleep 2";
    			text = "Exit";
    			keybind = "e";
			}
			{
				label = "shutdown";
    			action = "sleep 0.5 && systemctl poweroff";
    			text = "Shutdown";
    			keybind = "s";
			}
			{
    			label = "suspend";
    			action = "sleep 0.5 && systemctl suspend";
    			text = "Suspend";
    			keybind = "u";
			}
			{
				label = "reboot";
    			action = "sleep 0.5 && systemctl reboot";
    			text = "Reboot";
    			keybind = "r";
			}
		];
		style = ''
			@import '/home/c5514/.cache/wal/colors-wlogout.css';
			* {
				font-family: "Fira Sans Semibold", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
				background-image: none;
				transition: 20ms;
				box-shadow: none;
			}
			window {
				background-size: cover;
				color: #cdd6f4;
				background-color: rgba(17,17,27,0.8); 
			}
			button {
				color: #ced7f4;
				font-size:20px;
				background-repeat: no-repeat;
				background-position: center;
				background-size: 25%;
				/*border-style: solid;
				background-color: rgba(12, 12, 12, 0.8);
				border: 3px solid #FFFFFF;*/ 
				border: none;
				border-radius: 20px 20px 20px 20px;
				background-color: rgba(30,30,46,0);
				margin: 5px;
				transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
				/*box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);*/
			}

			button:focus{
				color: #FFFFFF;
				background-color: rgba(49,59,68,0.1);
				box-shadow: 0 4px 8px 0 @color13, 0 7px 14px 0 @color9 ,0 4px 8px 0 @color11;
			}
			button:active,
			button:hover {
				background-color: rgba(49,50,68,0.1);
				/*border: 5px solid @color13;*/
				box-shadow: 0 4px 8px 0 @color13, 0 7px 14px 0 @color9, 0 4px 8px 0 @color11;
			}
			/* 
			----------------------------------------------------- 
			Buttons
			----------------------------------------------------- 
			*/
			#lock {
				margin: 10px;
				border-radius: 20px;
				background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
			}
			#logout {
				margin: 10px;
				border-radius: 20px;
				background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
			}
			#suspend {
				margin: 10px;
				border-radius: 20px;
				background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
			}
			#hibernate {
				margin: 10px;
				border-radius: 20px;
				background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
			}
			#shutdown {
				margin: 10px;
				border-radius: 20px;
				background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
			}
			#reboot {
				margin: 10px;
				border-radius: 20px;
				background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
			}
		'';
	};
}
