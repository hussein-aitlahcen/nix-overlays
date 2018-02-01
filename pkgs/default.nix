final: previous: 

let 
	inherit (final) callPackage newScope;
in 
{
	emacs = callPackage ./emacs { };
	emacsPackagesNg = previous.emacsPackagesNg.overrideScope (_: self: {
		inherit (final) emacs;
	});
}
