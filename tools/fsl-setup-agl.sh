#!/bin/sh
#
# FSL Build Enviroment Setup Script
#
# Copyright (C) 2015 Freescale Semiconductor
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
    echo -e "\nDescription: fsl-setup-agl.sh will setup the bblayers and local.conf for an AGL build."
    echo -e "\nUsage: source fsl-setup-agl.sh
    Optional parameters: [-b build-dir] [-h]"
    echo "
    * [-b build-dir]: Build directory, if unspecified, script uses 'bld-agl' as the output directory
    * [-h]: help
"
}

agl_cleanup()
{
    echo "Cleaning up variables"
    unset BUILD_DIR AGLDISTRO
    unset fsl_setup_help fsl_setup_error fsl_setup_flag
    unset agl_usage agl_cleanup agl_exit_message
}

echo Reading command line parameters
# Read command line parameters
while getopts "k:r:t:b:e:gh" fsl_setup_flag
do
    case $fsl_setup_flag in
        b) BUILD_DIR="$OPTARG";
           echo -e "\n Build directory is $BUILD_DIR" ;
           ;;
        h) fsl_setup_help='true';
           ;;
        ?) fsl_setup_error='true';
           ;;
    esac
done

RELEASEPROGNAME="./fsl-setup-release.sh"

# get command line options
OLD_OPTIND=$OPTIND

# AGL only runs on Wayland
unset AGLDISTRO
AGLDISTRO="fsl-imx-agl-wayland"

if [ -z "$BUILD_DIR" ]; then
    BUILD_DIR=bld-agl
fi

echo EULA=1 DISTRO=$AGLDISTRO source $RELEASEPROGNAME -b $BUILD_DIR
EULA=1 DISTRO=$AGLDISTRO source $RELEASEPROGNAME -b $BUILD_DIR

echo -e "\n## AGL layers" >> $BUILD_DIR/conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-agl/meta-agl \"" >> $BUILD_DIR/conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-agl/meta-agl-bsp \"" >> $BUILD_DIR/conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-agl/meta-ivi-common \"" >> $BUILD_DIR/conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-agl-demo \"" >> $BUILD_DIR/conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-fsl-agl \"" >> $BUILD_DIR/conf/bblayers.conf

echo done except for cleanup

agl_exit_message
agl_cleanup
