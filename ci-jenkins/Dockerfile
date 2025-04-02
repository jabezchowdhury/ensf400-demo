FROM jenkins/jenkins:alpine

USER root

# Install Docker CLI and other needed tools
RUN apk add --no-cache \
    docker \
    openrc \
    curl \
    bash \
    git \
    openjdk11

# Set JAVA_HOME explicitly so Gradle can find it
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk \
    PATH=$JAVA_HOME/bin:$PATH

USER jenkins
