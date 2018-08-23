#/bin/bash

echo <<EOF >> /etc/security/limits.d
* soft nofile 65536
* hard nofile 65536
EOF

echo <<EOF >> /etc/pam.d/common-session
session required pam_limits.so
EOF

ulimit -SHn 65536

# check /proc/sys/fs/file-max
# reboot
