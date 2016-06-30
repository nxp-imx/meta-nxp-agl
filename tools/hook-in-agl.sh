#!/bin/sh
#
# NXP Build Enviroment Setup Script
#
# Copyright (C) 2015-2016 Freescale Semiconductor
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

if [ -e "conf/bblayers.conf" ]; then

unset AGLDISTRO
AGLDISTRO="nxp-imx-agl-wayland"

echo "BBLAYERS += \" \${BSPDIR}/sources/meta-openembedded/meta-efl \"" >> conf/bblayers.conf
echo -e "\n## AGL layers" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-rust \"" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-agl/meta-agl \"" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-agl/meta-agl-bsp \"" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-agl/meta-ivi-common \"" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-agl-demo \"" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-nxp-agl \"" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/gpsnavi-agl/meta-gpsnavi-agl \"" >> conf/bblayers.conf

echo -e "\nAGL layers added to bblayers.conf"

else
agl_usage
fi

agl_exit_message
agl_cleanup
