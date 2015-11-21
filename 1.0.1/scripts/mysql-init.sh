#!/bin/bash

set -e

sed -Ei 's/^(bind-address|log)/#&/' /etc/my.cnf
echo -e 'skip-host-cache\nskip-name-resolve' | awk '{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/my.cnf > /tmp/my.cnf
mv -f /tmp/my.cnf /etc/my.cnf
mysql_install_db --user=mysql --datadir="/var/lib/mysql" --rpm --keep-my-cnf
