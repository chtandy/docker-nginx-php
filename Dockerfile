#FROM php:8.1.1-fpm
## Install Postgre PDO
#RUN apt-get update && apt-get install -y libpq-dev \
#    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
#    && docker-php-ext-install pdo pdo_pgsql pgsql \ 
#    && rm -rf /var/lib/apt/lists/* && apt-get clean
FROM php:8.1.1-fpm
# Install Postgre PDO
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql \
    && docker-php-ext-configure pdo_pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql \
    && rm -rf /var/lib/apt/lists/* && apt-get clean
