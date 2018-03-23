self: super:

{
	processing3       = super.callPackage ./processing { };
  zsh-theme-dracula = super.callPackage ./zsh-theme-dracula { };
	emacs26           = super.callPackage ./emacs { };
}
