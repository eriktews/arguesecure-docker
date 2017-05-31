#!/bin/bash

cd /var/www/laravel
n=0
   until [ $n -ge 30 ]
   do
      php artisan migrate && break  # substitute your command here
      n=$[$n+1]
      sleep 2
   done
echo "\App\User::create(['name'=>'admin','email'=>'admin','password'=>bcrypt('XDARSEC')]);" | php artisan tinker


