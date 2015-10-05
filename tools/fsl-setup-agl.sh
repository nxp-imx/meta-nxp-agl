#!/bin/sh
#
# FSL Build Enviroment Setup Script
#
# Copyright (C) 2011-2013 Freescale Semiconductor
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
exit_message ()
{
   echo "AGL setup complete"
}

usage()
{
    echo -e "\nDescription: fsl-setup-agl.sh will setup the bblayers and local.conf for an AGL build."
    echo -e "\nUsage: source fsl-setup-agl.sh
    Optional parameters: [-b build-dir] [-h]"
    echo "
    * [-b build-dir]: Build directory, if unspecified, script uses 'bld-agl' as the output directory
    * [-h]: help
"
}

cleanup()
{
    echo "Cleaning up variables"
    unset BLDDIR AGLDISTRO
    unset fsl_setup_help fsl_setup_error fsl_setup_flag
    unset usage cleanup
#    exit_message cleanup
}

echo Reading command line parameters
echo getopts = $getopts
echo OPTARG = $OPTARG
# Read command line parameters
while getopts "k:r:t:b:e:gh" fsl_setup_flag
do
    case $fsl_setup_flag in
        b) BLDDIR="$OPTARG";
           echo -e "\n Build directory is " $BLDDIR ;
           ;;
        h) fsl_setup_help='true';
           ;;
        ?) fsl_setup_error='true';
           ;;
    esac
done
echo getopts = $getopts
echo OPTARG = $OPTARG

PROGNAME="fsl-setup-release"
# echo PROGNAME=$PROGNAME

# get command line options
OLD_OPTIND=$OPTIND
unset AGLDISTRO

# AGL only runs on Wayland
AGLDISTRO="fsl-imx-agl-wayland"

echo point3
usage
cleanup
exit_message
