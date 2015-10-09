FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append_mx6 = "\
    file://Add_definitions_EGL_CFLAGS_for_iMX_vivante.patch \
    "

#EXTRA_OEMAKE_mx6 += "-DEGL_API_FB=1 -DWL_EGL_PLATFORM=1"
