#!/bin/bash
echo "00 */23 * * *  ./etc/my_init.d/21_generate-freeradius-ldap.sh" > /var/spool/cron/crontabs/root
