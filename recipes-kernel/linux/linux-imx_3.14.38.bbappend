# Copyright (C) 2013-2015 Freescale Semiconductor
# Released under the MIT license (see COPYING.MIT for the terms)

do_configure_append() {
    sed -i s/#\ CONFIG_FHANDLE\ is\ not\ set/CONFIG_FHANDLE=y/g ${B}/.config
    sed -i s/#\ CONFIG_FHANDLE\ is\ not\ set/CONFIG_FHANDLE=y/g ${B}/../defconfig
    sed -i s/#\ CONFIG_DEVPTS_MULTIPLE_INSTANCES\ is\ not\ set/CONFIG_DEVPTS_MULTIPLE_INSTANCES=y/g ${B}/.config
    sed -i s/#\ CONFIG_DEVPTS_MULTIPLE_INSTANCES\ is\ not\ set/CONFIG_DEVPTS_MULTIPLE_INSTANCES=y/g ${B}/../defconfig
}
