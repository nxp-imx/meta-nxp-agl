SRC_URI = "git://gerrit.automotivelinux.org/gerrit/AGL/DemoApps/CES2016;protocol=http"

do_install_append() {
    sed -i 's,-I imports,-I imports -I dummyimports,g' ${D}/opt/AGL/CES2016/start_CES2016_*.sh
}
