do_install:append() {
    # Fix install of embedded TAs
    rm -rf ${D}${base_libdir}/optee_armtz
    install -d ${D}${nonarch_base_libdir}/optee_armtz/
    install -m 444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz/
}

FILES:${PN} = "${nonarch_base_libdir}"
