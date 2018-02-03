{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  name = "zsh-theme-dracula-${version}";
  version = "1.2.5";

  src = fetchgit {
    url = https://github.com/dracula/zsh.git;
    rev = "22058079469b74af07f1f4984df505f9b5156c1f";
    sha256 = "1zk9xm01v4chnxf9ns9c3kx2jal3lj88hadv5vp0zb8xr9vz4f31";
  };

  installPhase = ''
    mkdir -p $out/share/themes
    cp dracula.zsh-theme $out/share/themes
  '';

  meta = with stdenv.lib; {
    description = "Dracula theme for ZSH";
    homepage = https://draculatheme.com/zsh/;
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
