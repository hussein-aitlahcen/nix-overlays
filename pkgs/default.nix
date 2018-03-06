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

	processing = callPackage ./processing { };
	processingPackagesNg = previous.processingPackagesNg.overrideScope (_: self: {
		inherit (final) processing;
	});
}
