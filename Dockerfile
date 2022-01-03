#FROM php:8.1.1-fpm
## Install Postgre PDO
#RUN apt-get update && apt-get install -y libpq-dev \
#    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
#    && docker-php-ext-install pdo pdo_pgsql pgsql \ 
#    && rm -rf /var/lib/apt/lists/* && apt-get clean
FROM php:8.1.1-fpm
RUN apt-get update && apt-get install -y libpq-dev \
    # install pgsql
    && docker-php-ext-configure pgsql \
    && docker-php-ext-install -j$(nproc) pgsql \
    # install pdo_pgsql
    && docker-php-ext-configure pdo_pgsql \
    && docker-php-ext-install -j$(nproc) pdo_pgsql \
    # install xdebug
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    # install memcached
    && apt-get install -y libmemcached-dev libzip-dev locales \
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    # rm apt update cache
    && rm -rf /var/lib/apt/lists/* && apt-get clean

ENV TZ=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
