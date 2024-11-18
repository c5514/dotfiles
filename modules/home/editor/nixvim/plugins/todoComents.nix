{pkgs, ...}:
{
	programs.nixvim.plugins.todo-comments = {
		enable = true;
		keymaps.todoTelescope = {
			mode = "n";
			key = "<leader>ft";
			action = "TodoTelescope";
			options.desc = "Telecope find TODOs";
		};
		settings.colors = {
        	error = ["DiagnosticError" "ErrorMsg" "#DC2626"];
        	warning = ["DiagnosticWarn" "WarningMsg" "#FBBF24"];
        	info = ["DiagnosticInfo" "#2563EB"];
        	hint = ["DiagnosticHint" "#10B981"];
        	default = ["Identifier" "#7C3AED"];
        	test = ["Identifier" "#FF00FF"];
    	};
	};
}
