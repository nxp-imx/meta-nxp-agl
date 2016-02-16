FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = "\
    file://weston.service \
    file://weston.sh \
    "

inherit systemd
DEPENDS_append = " systemd"
FILESEXTRAPATHS_prepend := ":${THISDIR}/weston-ivi-shell:"

SRC_URI_append = " \
                  file://data/background.png \
                  file://data/fullscreen.png \
                  file://data/home.png \
                  file://data/icon_ivi_clickdot.png \
                  file://data/icon_ivi_flower.png \
                  file://data/icon_ivi_simple-egl.png \
                  file://data/icon_ivi_simple-shm.png \
                  file://data/icon_ivi_smoke.png \
                  file://data/panel.png \
                  file://data/random.png \
                  file://data/sidebyside.png \
                  file://data/tiling.png \
                  file://weston.ini.ivi-shell \
                 "

EXTRA_OECONF_append = " --enable-ivi-shell"

do_compile_prepend() {
      cp -f ${WORKDIR}/data/* ${S}/data
}

do_install_append() {
    mkdir -p ${D}${systemd_unitdir}/system/
    cp ${WORKDIR}/weston.service ${D}${systemd_unitdir}/system/
    mkdir -p ${D}${systemd_unitdir}/system/multi-user.target.wants/
    ln -sf /lib/systemd/system/weston.service ${D}/${systemd_unitdir}/system/multi-user.target.wants/weston.service

    WESTON_INI_CONFIG=${sysconfdir}/xdg/weston
    install -d ${D}${WESTON_INI_CONFIG}
    install -m 0644 ${S}/ivi-shell/weston.ini.in ${D}${WESTON_INI_CONFIG}/weston.ini
    sed -i -e 's/hmi-controller.so/hmi-controller.so,ivi-controller.so/' \
          -e 's|\@libexecdir\@|${libexecdir}|' \
          -e 's|\@plugin_prefix\@||' \
          -e 's|\@abs_top_srcdir\@\/data|${datadir}\/weston|' \
          -e 's|\@abs_top_builddir\@\/clients|${bindir}|' \
          -e 's|\@abs_top_builddir\@\/weston-ivi-shell-user-interface|${libdir}/weston/weston-ivi-shell-user-interface|' \
          ${D}${WESTON_INI_CONFIG}/weston.ini
    sed -i -e 's|\@abs_top_builddir\@\/weston-|${bindir}/weston-|' \
          ${D}${WESTON_INI_CONFIG}/weston.ini

}

FILES_${PN} += " \
    ${systemd_unitdir}/system/* \
    ${sysconfdir}/xdg/weston/weston.ini \
    "
