#!/bin/bash

bash /root/migrate.sh
(
cd /var/www/laravel/
nohup node server/server.js 2>&1 &
)
/usr/sbin/apache2ctl -D FOREGROUND
