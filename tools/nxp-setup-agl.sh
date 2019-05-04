#!/bin/sh
#
# NXP Build Enviroment Setup Script
#
# Copyright (C) 2015-2016 Freescale Semiconductor
# Copyright (C) 2017-2018 NXP
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

echo -e "\n----------------\n"
agl_exit_message()
{
   echo "AGL setup complete"
}

agl_usage()
{
    echo -e "\nDescription: nxp-setup-agl.sh will setup the bblayers and local.conf for an AGL build."
    echo -e "\nUsage: source nxp-setup-agl.sh
    Optional parameters: [-b build-dir] [-h]"
    echo "
    * [-b build-dir]: Build directory, if unspecified, script uses 'bld-agl' as the output directory
    * [-h]: help
"
}

agl_cleanup()
{
    echo "Cleaning up variables"
    unset BUILD_DIR AGLDISTRO OPTIND
    unset nxp_setup_help nxp_setup_error nxp_setup_flag
    unset agl_usage agl_cleanup agl_exit_message
}

echo Reading command line parameters
# Read command line parameters
while getopts "k:r:t:b:e:g:h" nxp_setup_flag
do
    case $nxp_setup_flag in
        b) BUILD_DIR="$OPTARG";
           echo -e "\n Build directory is $BUILD_DIR" ;
           ;;
        h) nxp_setup_help='true';
           ;;
        ?) nxp_setup_error='true';
           ;;
    esac
done

RELEASEPROGNAME="./fsl-setup-release.sh"

# get command line options
OLD_OPTIND=$OPTIND

# AGL only runs on Wayland
unset AGLDISTRO
AGLDISTRO="imx-agl-wayland"

if [ -z "$BUILD_DIR" ]; then
    BUILD_DIR=bld-agl
fi

echo EULA=1 DISTRO=$AGLDISTRO source $RELEASEPROGNAME -b $BUILD_DIR
EULA=1 DISTRO=$AGLDISTRO source $RELEASEPROGNAME -b $BUILD_DIR

agl_layers='
# Layers for AGL demo
BBLAYERS += "${BSPDIR}/sources/meta-agl-demo"
BBLAYERS += "${BSPDIR}/sources/meta-agl-devel/meta-hmi-framework"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-agl-distro"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-agl-profile-core"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-agl-profile-cluster"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-agl-profile-graphical"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-app-framework"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-security"
BBLAYERS += "${BSPDIR}/sources/meta-nxp-agl"
BBLAYERS += "${BSPDIR}/sources/meta-openembedded/meta-perl"
BBLAYERS += "${BSPDIR}/sources/meta-security"
'

echo "$agl_layers" >> conf/bblayers.conf

echo done except for cleanup

agl_exit_message
agl_cleanup

#run aglsetup.sh script
source ../sources/meta-agl/scripts/aglsetup.sh -b .

