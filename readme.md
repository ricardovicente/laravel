# Curso SON - Publicando imagem Laravel

## Instalado o PHP localmente
    $ sudo apt update
    $ sudo apt upgrade
    $ sudo add-apt-repository ppa:ondrej/php
    $ sudo apt update
    $ sudo apt-get install php7.3
    $ sudo apt install php7.3-cli php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd  php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath php7.3-json

## Instalado o Composer localmente
    $ php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    $ php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    $ php composer-setup.php
    $ php -r "unlink('composer-setup.php');"
    $ mv composer.phar /usr/local/bin/composer

## Criado o projeto Laravel
    $ composer create-project --prefer-dist laravel/laravel laravel

### Alterada permissão no diretório storage
    $ chmod o+w -R storage

### Verificada instalação local
    $ php artisan serve

Abrir no navegador: http://localhost:8000

## Criado o Dockercompose com:
    FROM php:7.3.6-fpm-alpine3.9

    WORKDIR /var/www

    RUN apk add --no-cache openssl bash mysql-client
    RUN docker-php-ext-install pdo pdo_mysql
    RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
    RUN rm -rf /var/www/html

    COPY . /var/www

    RUN ln -s public html

    EXPOSE 9000

    ENTRYPOINT ["php-fpm"]

## Criado o build da imagem
    $ docker build -t laravel:latest .

## Criado o docker-compose.yml

## Executado o docker-compose.yml
    $ docker-compose up -d

## Commit do container
    $ docker commit <container id>  rvicente/laravel

## Login
    $ docker login

- Inseridas as credenciais

## Push
    $ docker push <container id> rvicente/laravel

---

## Como utilizar:
    $ docker pull rvicente/laravel
    $ docker run -d --name laravellocal rvicente/laravel

Então

    $ docker exec -it laravellocal ls -lah
    $ docker exec -it laravellocal bash

