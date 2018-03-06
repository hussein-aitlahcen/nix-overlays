{ fetchurl, stdenv, ant, jdk9, makeWrapper, libXxf86vm, which }:

stdenv.mkDerivation rec {
  name = "processing-${version}";
  version = "3.3.6";

  src = fetchurl {
    url = "https://github.com/processing/processing/releases/download/processing-0263-${version}/processing-${version}-linux64.tgz";
    sha256 = "1r8q5y0h4gpqap5jwkspc0li6566hzx5chr7hwrdn8mxlzsm50xk";
  };

  # # Stop it trying to download its own version of java
  # patches = [ ./use-nixpkgs-jre.patch ];

  buildInputs = [ ant jdk9 makeWrapper libXxf86vm which ];

  buildPhase = "cd build && ant build";

  installPhase = ''
    mkdir -p $out/${name}
    mkdir -p $out/bin
   cp -r linux/work/* $out/${name}/
   makeWrapper $out/${name}/processing $out/bin/processing \
     --prefix PATH : "${stdenv.lib.makeBinPath [ jdk9 which ]}" \
     --prefix LD_LIBRARY_PATH : ${libXxf86vm}/lib
   makeWrapper $out/${name}/processing-java $out/bin/processing-java \
     --prefix PATH : "${stdenv.lib.makeBinPath [ jdk9 which ]}" \
     --prefix LD_LIBRARY_PATH : ${libXxf86vm}/lib
   ln -s ${jdk9} $out/${name}/java
  '';

  meta = with stdenv.lib; {
    description = "A language and IDE for electronic arts";
    homepage = https://processing.org;
    license = licenses.gpl2Plus;
    maintainers = [ maintainers.goibhniu ];
    platforms = platforms.linux;
  };
}
