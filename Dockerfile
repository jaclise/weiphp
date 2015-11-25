FROM php:5.6-cli
#COPY . /app
WORKDIR /app
RUN apt-get update
RUN apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install mysql pdo pdo_mysql mbstring gd
CMD [ "php","-S", "0.0.0.0:8000" ]
