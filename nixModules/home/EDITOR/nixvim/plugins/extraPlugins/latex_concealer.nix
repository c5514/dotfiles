
{inputs, pkgs,...}:
let 
	latex_concealer = pkgs.vimUtils.buildVimPlugin {
		pname = "latex_concealer";
		version = "2024-11-01";
		src = inputs.latex_concealer;
	};
in
{
	programs.nixvim = {
		extraPlugins = [
			latex_concealer
		];
		# extraConfigLua = ''
		# 	ft={"tex","latex"},
		# 		opts={},
		# 		config=true,
		# '';
	};
}
