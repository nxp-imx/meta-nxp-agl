require conf/include/agl_imx-common.inc

DISTRO_FEATURES:append = " agl-medium-arm-compiler"

# Force use of the NXP BSP and kernel
IMX_DEFAULT_BSP = "nxp"
IMX_DEFAULT_KERNEL:${MACHINE} = "linux-imx"

# For EVKB wifi support
#MACHINE_FEATURES_append = " bcm4356"

# Add helper to drive setting up HCI UART device
#MACHINE_EXTRA_RRECOMMENDS_append = " hci-uart-helper"

AGL_DEFAULT_INITRAMFS_FSTYPES := ""

PREFERRED_VERSION_u-boot ?= "2022.04"
