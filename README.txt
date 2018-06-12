This builds the Wayland-Weston AGL image with the basic AGL interface. 
Demos can then be run on top of this.

This image has only been run on i.MX 6QP Sabre and Sabre Auto.
It is not supported nor tested.  It is simply a demo showing that the basic image runs.
It runs on the 4.9.88-2.0.0 NXP release of Linux.

Build instructions:
To get the BSP you need to have `repo` installed.

Install the `repo` utility (only need to do once per user):
--------------------------------------------------

$: mkdir ~/bin
$: curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
$: chmod a+x ~/bin/repo
$: PATH=${PATH}:~/bin

Download the BSP Yocto Project Environment into your directory:
-------------------------------------------

$: mkdir imx-yocto-bsp
$: cd imx-yocto-bsp
$: repo init -u https://source.codeaurora.org/external/imx/imx-manifest -b imx-linux-rocko -m imx-4.9.88-2.0.0_agl-demo.xml

$: repo sync

Setup and Build for Wayland (currently, only one supported)
-------------------------------------------
$: DISTRO=imx-agl-wayland MACHINE=imx6qpsabreauto source nxp-setup-agl.sh -b bld-agl

IMAGES
-------------------------------------------
Most interesting results currently seen with:
$: bitbake agl-demo-platform

Other images:
$: bitbake agl-image-minimal
$: bitbake agl-image-ivi
$: bitbake agl-image-weston
