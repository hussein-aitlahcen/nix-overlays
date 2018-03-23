self: super:

with super.lib;

(foldl' (flip extends) (_: super) [

  (import ./pkgs/default.nix)

]) self
