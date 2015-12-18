
Build instructions:

Install the `repo` utility:

$: mkdir ~/bin
$: curl http://commondatastorage.googleapis.com/git-repo-downloads/repo  > ~/bin/repo
$: chmod a+x ~/bin/repo
$: PATH=${PATH}:~/bin

Download the BSP Yocto Project Environment

$: mkdir fsl-arm-yocto-bsp
$: cd fsl-arm-yocto-bsp
$: repo init -u http://sw-stash.freescale.net/scm/imx/fsl-arm-yocto-bsp.git -b imx-3.14.38-6QP_ga-agl
$: repo sync

Setup and Build for Wayland (currently, only one supported)
$: DISTRO=fsl-imx-agl-wayland MACHINE=imx6qpsabreauto source fsl-setup-agl.sh -b bld-agl

Most interesting results currently seen with:
$: bitbake agl-demo-platform

Other images:
$: bitbake agl-image-minimal
$: bitbake agl-image-ivi
$: bitbake agl-image-weston


