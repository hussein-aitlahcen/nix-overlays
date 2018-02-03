{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  name = "zsh-theme-dracula-${version}";
  version = "1.2.5";

  src = fetchgit {
    url = https://github.com/dracula/zsh.git;
    rev = "22058079469b74af07f1f4984df505f9b5156c1f";
    sha256 = "1kn88i93fwiyk1cmhrm67j973i4f6pr34yixrnql24wz8w5zk8zi";
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
