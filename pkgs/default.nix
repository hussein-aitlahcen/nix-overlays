final: previous: 

let 
	inherit (final) callPackage newScope;
in 
{
  zsh-theme-dracula = callPackage ./zsh-theme-dracula { };

	emacs = callPackage ./emacs { };
	emacsPackagesNg = previous.emacsPackagesNg.overrideScope (_: self: {
		inherit (final) emacs;
	});
}
