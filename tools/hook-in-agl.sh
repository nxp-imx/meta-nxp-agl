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

agl_exit_message()
{
   echo "AGL setup complete"
}

agl_usage()
{
    echo -e "\nDescription: hook-in-agl.sh will setup the bblayers for an AGL build."
    echo -e "\nUsage: source hook-in-agl.sh
       Run in the build directory.
"
}

agl_cleanup()
{
    echo -e "Cleaning up variables\n"
    unset AGLDISTRO
    unset nxp_setup_help nxp_setup_error nxp_setup_flag
    unset agl_usage agl_cleanup agl_exit_message
}

agl_layers='
# Layers for AGL demo
BBLAYERS += "${BSPDIR}/sources/meta-agl-demo"
BBLAYERS += "${BSPDIR}/sources/meta-agl-devel/meta-pipewire"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-agl-bsp"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-agl-distro"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-agl-profile-core"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-agl-profile-graphical"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-agl-profile-graphical-qt5"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-app-framework"
BBLAYERS += "${BSPDIR}/sources/meta-agl/meta-security"
BBLAYERS += "${BSPDIR}/sources/meta-nxp-agl"
BBLAYERS += "${BSPDIR}/sources/meta-openembedded/meta-perl"
BBLAYERS += "${BSPDIR}/sources/meta-security"
'

if [ -e "conf/bblayers.conf" ]; then
	echo "$agl_layers" >> conf/bblayers.conf
	echo -e "\nAGL layers added to bblayers.conf"
else
	agl_usage
fi

agl_exit_message
agl_cleanup
