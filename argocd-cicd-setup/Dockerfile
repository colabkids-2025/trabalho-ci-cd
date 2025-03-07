FROM ubuntu:latest

LABEL name="Colabkids"
LABEL email="ccolabkids@gmail.com"

ENV UBUNTU_HOME=/var/www/html/

RUN apt-get update -y && apt-get install -y tzdata apache2 && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=noninteractive	

WORKDIR /var/www/html/

COPY script/index.html /var/www/html/

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
