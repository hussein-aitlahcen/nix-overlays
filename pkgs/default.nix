final: previous:

let
	inherit (final) callPackage newScope;
in
{
	processing3 = callPackage ./processing { };

  zsh-theme-dracula = callPackage ./zsh-theme-dracula { };

	emacs26 = callPackage ./emacs { };
}
