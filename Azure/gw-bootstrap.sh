#!/bin/bash
touch /home/admin/test.txt

clish -c 'set user admin shell /bin/bash' -s

config_system -s 'install_security_gw=true&install_ppak=true&gateway_cluster_member=false&install_security_managment=true&install_mgmt_primary=true&install_mgmt_secondary=false&download_info=true&hostname=R80dot40mgmt&mgmt_gui_clients_radio=any&mgmt_admin_radio=gaia_admin'