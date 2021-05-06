FROM ubuntu

RUN apt-get update -y && \
    apt-get install -y tzdata && \
    apt-get install -y software-properties-common && \
    apt-get install apache2 -y

WORKDIR /var/www/html

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV LANG C

COPY index.html index.html

CMD [ "/usr/sbin/apache2","-D","FOREGROUND" ]

EXPOSE 80
