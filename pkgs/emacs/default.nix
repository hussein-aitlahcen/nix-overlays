{ stdenv, fetchgit, autoreconfHook, pkgconfig, texinfo, gnutls
, gtk3 ? null, libXaw, libXext, libXpm, libjpeg, libpng, libtiff
, libungif, libxml2 , ncurses, gettext, acl, gpm, dbus
, libselinux, Xaw3d, alsaLib, imagemagick, libXft, librsvg
, xlibsWrapper, automake
}:

stdenv.mkDerivation rec {
  name = "emacs-${version}${versionModifier}";
  version = "26.0";
  versionModifier = ".91";

  src = fetchgit {
    url = https://git.savannah.gnu.org/git/emacs.git;
    rev = "8d4500087f547e203cfba03f61dcbe641bf650de";
    sha256 = "1zk9xm01v4chnxf9ns9c3kx2jal3lj88hadv5vp0zb8xr9vz4f31";
  };

  nativeBuildInputs = [
    autoreconfHook
    automake
    pkgconfig
    texinfo
  ];

  buildInputs = [
    gtk3
    gnutls
    libxml2
    libXaw
    libXext
    libXpm
    libXft
    libjpeg
    libpng
    libtiff
    libungif
    librsvg
    ncurses
    xlibsWrapper
    texinfo
    gettext
    gpm
    libselinux
    dbus
    Xaw3d
    alsaLib
    imagemagick
  ];

  CFLAGS = "-O3";

  configureFlags = [
    "--with-modules"
    "--with-x-toolkit=gtk3"
    "--with-xft"
  ];

  patchPhase = ''
    echo '(defun emacs-repository-get-version (&rest _) "${src.rev}")' >> lisp/version.el
    for f in $(find . -name Makefile.in); do
      substituteInPlace $f --replace /bin/pwd pwd
    done
  '';

  fixupPhase = ''
    mkdir -p $out/share/emacs/site-lisp
    cp ${<nixpkgs/pkgs/applications/editors/emacs/site-start.el>} $out/share/emacs/site-lisp/site-start.el
    $out/bin/emacs --batch -f batch-byte-compile $out/share/emacs/site-lisp/site-start.el
  '';

  meta = with stdenv.lib; {
    description = "The extensible, customizable GNU text editor";
    homepage = https://www.gnu.org/software/emacs/;
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
