FROM debian:bullseye

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# Basics
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    lsb-release \
    git \
    jq \
    && rm -rf /var/lib/apt/lists/*

# PHP Repo
RUN curl -L -o /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

# PHP 7.4
RUN apt-get update && apt-get install -y \
    php7.4 \
    php7.4-curl \
    php7.4-soap \
    php7.4-xml \
    php7.4-ldap \
    php7.4-zip \
    php7.4-gmp \
    php7.4-intl \
    php7.4-xdebug \
    php7.4-gd \
    php7.4-mysql \
    php7.4-mbstring \
    && rm -rf /var/lib/apt/lists/*
COPY ./php-ini-overrides.ini /etc/php/7.4/cli/conf.d/

# PHP 8.0
RUN apt-get update && apt-get install -y \
    php8.0 \
    php8.0-curl \
    php8.0-soap \
    php8.0-xml \
    php8.0-ldap \
    php8.0-zip \
    php8.0-gmp \
    php8.0-intl \
    php8.0-xdebug \
    php8.0-gd \
    php8.0-mysql \
    php8.0-mbstring \
    && rm -rf /var/lib/apt/lists/*
COPY ./php-ini-overrides.ini /etc/php/8.0/cli/conf.d/

# PHP 8.1
RUN apt-get update && apt-get install -y \
    php8.1 \
    php8.1-curl \
    php8.1-soap \
    php8.1-xml \
    php8.1-ldap \
    php8.1-zip \
    php8.1-gmp \
    php8.1-intl \
    php8.1-xdebug \
    php8.1-gd \
    php8.1-mysql \
    php8.1-mbstring \
    && rm -rf /var/lib/apt/lists/*
COPY ./php-ini-overrides.ini /etc/php/8.1/cli/conf.d/

# PHP 8.2
RUN apt-get update && apt-get install -y \
    php8.2 \
    php8.2-curl \
    php8.2-soap \
    php8.2-xml \
    php8.2-ldap \
    php8.2-zip \
    php8.2-gmp \
    php8.2-intl \
    php8.2-xdebug \
    php8.2-gd \
    php8.2-mysql \
    php8.2-mbstring \
    && rm -rf /var/lib/apt/lists/*
COPY ./php-ini-overrides.ini /etc/php/8.2/cli/conf.d/

# Default to PHP 7.4
RUN sudo update-alternatives --set php /usr/bin/php7.4
RUN sudo update-alternatives --set phar /usr/bin/phar7.4
RUN sudo update-alternatives --set phar.phar /usr/bin/phar.phar7.4

# Add a normal user and enable sudo
RUN useradd -u 1000 -ms /bin/bash user
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user

# Install a newer composer
RUN mkdir -p /home/user/.local/bin
RUN curl -L https://github.com/composer/getcomposer.org/raw/main/web/download/2.4.4/composer.phar -o /home/user/.local/bin/composer
RUN chmod a+x /home/user/.local/bin/composer
ENV PATH "/home/user/.local/bin:${PATH}"

WORKDIR /home/user