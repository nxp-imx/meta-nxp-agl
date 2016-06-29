
# This gets rid of the host contamination warning
LICENSE_CREATE_PACKAGE = "0"

# This fixes an error caused by using cp -ar.
do_install() {
    mkdir -p ${D}/opt/AGL/CES2016/
    cp -r ./* ${D}/opt/AGL/CES2016/
}
