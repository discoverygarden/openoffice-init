#OpenOffice Init Scripts

## Introduction

Systemd, sysvinit scripts to start OpenOffice headless.

## Requirements

This module requires OpenOffice/LibreOffice is installed and the apache user's home dir has been chown'd so apache is the owner.

## Installation

Clone/unzip onto your server.

## sysvinit

Copy the `sysvinit/openoffice` file into `/etc/init.d`

Ensure permissions are 755

To have the opeoffice start on system boot, run the following:

```bash
# UBUNTU 14 (or lower):
/usr/sbin/update-rc.d openoffice defaults 99 20
# REDHAT 6 (or lower):
sed -i "s|SOFFICE_USER=www-data|SOFFICE_USER=apache|" /etc/init.d/openoffice
chkconfig --add openoffice
```

To start the workers immediately:
```bash
/etc/init.d/openoffice start
```
## systemd

Copy `systemd/*` files into /etc/systemd/system

### Reload Daemon

```
systemctl daemon-reload
```

### Enable on boot

```
systemctl enable openoffice.service
```

### Status/start/stop
```
systemctl status openoffice.service
systemctl start openoffice.service
systemctl stop openoffice.service
```

## Troubleshooting/Issues

Having problems or solved a problem? Contact [discoverygarden](http://support.discoverygarden.ca).

## Maintainers/Sponsors

Current maintainers:

* [discoverygarden Inc.](http://www.discoverygarden.ca)

## Development

If you would like to contribute to this module, please check out our helpful
[Documentation for Developers](https://github.com/Islandora/islandora/wiki#wiki-documentation-for-developers)
info, [Developers](http://islandora.ca/developers) section on Islandora.ca and
contact [discoverygarden](http://support.discoverygarden.ca).

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
