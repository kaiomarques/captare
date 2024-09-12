FROM php:8.2-fpm

# Instala dependências necessárias
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpq-dev \
    libicu-dev \
    curl \
    unzip

# Configura e instala as extensões PHP necessárias
RUN docker-php-ext-configure zip \
    && docker-php-ext-install -j$(nproc) zip pgsql intl pdo_pgsql pdo_mysql

# Instala o Redis via PECL e habilita
RUN pecl install redis \
    && docker-php-ext-enable redis

# Instala o Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

# Instala o Symfony CLI
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash \
    && apt-get install -y symfony-cli

# Define o diretório de trabalho
WORKDIR /app/

# Copia o código do projeto para o container
COPY ./backend/ .

# Expõe a porta
EXPOSE 9000