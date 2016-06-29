do_install_append() {
       sed -i 's/\/lib\/weston/\/libexec/g'  ${D}/etc/xdg/weston/weston.ini
}

