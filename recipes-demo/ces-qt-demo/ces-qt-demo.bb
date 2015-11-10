DESCRIPTION = "QT Demo App for CES 2016 Provided by Jaquar Land Rover"
LICENSE = "MPL-2.0"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=815ca599c9df247a0c7f619bab123dad"

SRC_URI = "git://git.automotivelinux.org/AGL/DemoApps/CES2016.git"

SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

do_install() {
    install -d ${D}/opt/AGL/CES2016
    cp -r ${S}/* ${D}/opt/AGL/CES2016
}

FILES_${PN} += " /opt "
