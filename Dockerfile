FROM eboraas/laravel:stretch

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs python build-essential php-memcached; apt-get clean

# Clone the repository
RUN cd /root; git clone https://github.com/hitandyrun/arguesecure-online.git

# Apply some patches for c63de74a775004a0c886bf8d00dff49f378e14fa
ADD server.js /root/arguesecure-online/server/
ADD cache.php /root/arguesecure-online/config/
ADD database.php /root/arguesecure-online/config/

# Install dependencies
RUN cd /root/arguesecure-online; composer install
RUN cd /root/arguesecure-online; npm install

# Move the application to the target directory
RUN rm -rf /var/www/laravel; mv /root/arguesecure-online /var/www/laravel; chown -R www-data.www-data /var/www/laravel

# Add the startup-scripts
ADD migrate.sh /root/
ADD startup.sh /root/

EXPOSE 80 3002

CMD ["/root/startup.sh"]
