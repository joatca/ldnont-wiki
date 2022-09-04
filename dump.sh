#!/bin/bash

cd /usr/share/webapps/mediawiki
php7 ./maintenance/dumpBackup.php --full | pixz -9 >/usr/share/webapps/git/ldnont/ldnont-full.xml.xz
php7 ./maintenance/dumpBackup.php --current >/usr/share/webapps/git/ldnont/ldnont-current.xml
sed -e 's/^\$wgSecretKey.*$/$wgSecretKey = "**CENSORED**";/' -e 's/^\$wgUpgradeKey.*$/$wgUpgradeKey = "**CENSORED**";/' LocalSettings.php >/usr/share/webapps/git/ldnont/LocalSettings.php
cd /usr/share/webapps/git/ldnont
git add .
git commit -m "automatic dump at $(date)"
git push
