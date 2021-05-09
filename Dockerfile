# Multi-stage build setup (https://docs.docker.com/develop/develop-images/multistage-build/)

# Stage 1 (to create a "build" image, ~140MB)
FROM ubuntu:18.04

RUN apt update -y && \
    apt-get install openjdk-8-jdk -y && \
    apt-get install apache2 -y && \
    service apache2 start

COPY . /usr/src/myapp/

WORKDIR /usr/src/myapp/

EXPOSE 8123

ENTRYPOINT ["java", "-jar", "target/app.jar"]
