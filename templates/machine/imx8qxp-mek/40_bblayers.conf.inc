# This must be parsed after qt5, etc. layers so that they are correctly
# recognized by meta-freescale/dynamic-layers
BBLAYERS =+ "\
  ${METADIR}/bsp/meta-arm/meta-arm \
  ${METADIR}/bsp/meta-arm/meta-arm-toolchain \
  ${METADIR}/bsp/meta-freescale \
  ${METADIR}/bsp/meta-freescale-distro \
  ${METADIR}/external/meta-imx/meta-bsp \
  ${METADIR}/external/meta-imx/meta-sdk \
  ${METADIR}/meta-nxp-agl \
  "
