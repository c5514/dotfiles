
{inputs, pkgs,...}:
let 
	illustrate = pkgs.vimUtils.buildVimPlugin {
		pname = "illustrate";
		version = "2024-08-06";
		src = inputs.illustrate;
	};
in
{
	programs.nixvim = {
		extraPlugins = [
			illustrate
		];
		extraConfigLua = ''${builtins.readFile ../illustrate.lua}'';
	};
}
