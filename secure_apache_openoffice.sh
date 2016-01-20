#!/bin/bash
APACHE_USER=www-data
#note use this is to clean up the old way of using apache to start openoffice since it is insecure.
if [ -f /etc/init.d/openoffice ]; then
	service openoffice stop
	usermod --shell /bin/false $APACHE_USER
        rm -f /etc/init.d/openoffice
        cd /etc/init.d && wget --no-check-certificate https://raw.github.com/discoverygarden/openoffice-init-script/master/openoffice && chmod a+x openoffice
	useradd -m -d /home/openoffice -s /bin/false openoffice
        service openoffice start
fi
