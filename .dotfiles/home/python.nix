{pkgs, ...}:
{
	home.packages = with pkgs.python312Packages; [
		python 
		numpy
		scipy
		matplotlib
		scikit-learn
		pandas
		jedi
	];
}
