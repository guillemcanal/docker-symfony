#!/bin/sh

set -e

# Check folder ownership
owner_uid=$(stat -c '%u' /var/www)
owner_gid=$(stat -c '%g' /var/www)

# Check if the /var/www folder is owned by the current www-data user's uid
if [ "$(id -u www-data)" != "$owner_uid" ];then

	old_uid=`id -u www-data`
	old_gid=`id -g www-data`

	# Change www-data uid and gid
	usermod -u $owner_uid www-data
	groupmod -g $owner_gid www-data

	# Create www-data user directory
	mkdir -p /home/www-data
	usermod -d /home/www-data www-data
fi

exec php-fpm7 -F
