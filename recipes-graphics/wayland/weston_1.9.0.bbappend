FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

# This patch adds a missing #include config.h which would cause the screen to be blank if not added.
SRC_URI_append = " \
                  file://ivi-start.sh \
                  file://0001-ivi-shell-user-interface-fix-runtime-error-caused-by.patch \
                 "

EXTRA_OECONF_remove = "--enable-setuid-install"
EXTRA_OECONF_append = " --disable-setuid-install" 


# This adds the --tty=1 argument to weston start
do_install_append() {
    mkdir -p ${D}/usr/share/weston-start
    cp ${WORKDIR}/ivi-start.sh ${D}/usr/share/weston-start
}
