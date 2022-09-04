#!/bin/bash

cd /usr/share/webapps/mediawiki
php7 ./maintenance/dumpBackup.php --full | pixz -9 >/usr/share/webapps/git/ldnont/ldnont-full.xml.xz
php7 ./maintenance/dumpBackup.php --current | pixz -9 >/usr/share/webapps/git/ldnont/ldnont-current.xml
cp LocalSettings.php /usr/share/webapps/git/ldnont
