FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

# QT_MODULE_BRANCH = "5.4"

DEPENDS_append_koelsch = " libegl gles-user-module"
DEPENDS_append_porter = " libegl gles-user-module"
