#!/bin/ash

set -e

# Check folder ownership
owner_uid=$(stat -c '%u' /var/www)
owner_gid=$(stat -c '%g' /var/www)

# Check if the /var/www folder is owned by the current www-data user's uid
if [ "$(id -u www-data)" != "$owner_uid" ];then
	# Change www-data uid and gid
	usermod -u $owner_uid www-data
	groupmod -g $owner_gid www-data
fi

exec nginx
