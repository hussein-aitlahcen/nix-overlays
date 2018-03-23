self: super:

let
	inherit (final) callPackage;
in
{
	processing3 = callPackage ./processing { };

  zsh-theme-dracula = callPackage ./zsh-theme-dracula { };

	emacs26 = callPackage ./emacs { };
}
