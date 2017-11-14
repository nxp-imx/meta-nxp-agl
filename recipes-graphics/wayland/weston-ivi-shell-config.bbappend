do_install_append() {
	sed -i 's,shell=ivi-shell.so,shell=desktop-shell.so,' ${D}/etc/xdg/weston/weston.ini
	# fix paths in weston.ini
	sed -i 's,/usr/lib/weston/,/usr/libexec/,g' ${D}/etc/xdg/weston/weston.ini
	# fix config for hmi controller
	sed -i '/\[ivi-shell\]/a surface-id-offset=10' ${D}/etc/xdg/weston/weston.ini
}

