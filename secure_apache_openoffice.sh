#!/bin/bash
APACHE_USER=www-data
#note use this is to clean up the old way of using apache to start openoffice since it is insecure.
if [ -f /etc/init.d/openoffice ]; then
	service openoffice stop
	usermod --shell /bin/false $APACHE_USER
	sed -i "s|$APACHE_USER|openoffice|g" /etc/init.d/openoffice
	useradd -m -d /home/openoffice -s /bin/sh openoffice
        service openoffice start
fi
