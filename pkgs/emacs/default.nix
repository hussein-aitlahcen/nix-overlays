{ stdenv, fetchgit, autoreconfHook, pkgconfig, texinfo, gnutls
, gtk3, libXaw, libXext, libXpm, libjpeg, libpng, libtiff, libungif
, ncurses }:

stdenv.mkDerivation rec {
  name = "emacs-${version}${versionModifier}";
  version = "26.0";
  versionModifier = ".91";

  src = fetchgit {
    url = https://git.savannah.gnu.org/git/emacs.git;
    rev = "8d4500087f547e203cfba03f61dcbe641bf650de";
    sha256 = "1zk9xm01v4chnxf9ns9c3kx2jal3lj88hadv5vp0zb8xr9vz4f31";
  };
 
  nativeBuildInputs = [ autoreconfHook pkgconfig texinfo ];

  buildInputs = [
    gnutls
    gtk3
    libXaw
    libXext
    libXpm
    libjpeg
    libpng
    libtiff
    libungif
    ncurses
    texinfo
  ];

  meta = with stdenv.lib; {
    description = "The extensible, customizable GNU text editor";
    homepage = https://www.gnu.org/software/emacs/;
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
