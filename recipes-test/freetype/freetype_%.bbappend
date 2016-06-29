# Had to re-write this recipe since the md5/sha256 sum values changed and the demos listed
# in the original cannot be found.


FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI =+ "${SOURCEFORGE_MIRROR}/freetype/ft2demos-${PV}.tar.bz2;name=ft2demos \
          "
SRC_URI[ft2demos.md5sum] = "f7c6102f29834a80456264fe4edd81d1"
SRC_URI[ft2demos.sha256sum] = "b076ac52465e912d035f111ede78b88bf3dd186f91a56a54ff83ffdf862e84e4"

PACKAGES =+ "${PN}-demos"

do_compile_append () {
        oe_runmake -C ${WORKDIR}/ft2demos-${PV} TOP_DIR=${WORKDIR}/${PN}-${PV}
}

do_install_append () {
        install -d -m 0755 ${D}/${bindir}
}

