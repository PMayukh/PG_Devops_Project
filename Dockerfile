FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y tzdata && \
    apt-get install -y software-properties-common && \
    apt-get install apache2 -y

COPY index.html /var/www/html

CMD ["/bin/bash"]

EXPOSE 80
