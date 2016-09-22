# remove packagegroup-agl-app-framework-examples

IMAGE_INSTALL_remove = " \
    packagegroup-agl-app-framework-examples \
    "

# Patch it as CES2016/ALS2016 recipe does not make these plugins install to rootfs
MAGE_INSTALL_append = " \
    qtmultimedia-qmlplugins \
    qtquickcontrols-qmlplugins \
    qtsvg-plugins \
"
