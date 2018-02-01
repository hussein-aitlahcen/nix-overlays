final: previous: 

let 
	inherit (final) callPackage;
in 
{
	emacs = callPackage /.emacs { };
}
