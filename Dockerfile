# Use a base image with Java 11 installed
FROM openjdk:11-jdk-slim

# Set environment variables for Maven installation
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_VERSION 3.8.4
ENV PATH $MAVEN_HOME/bin:$PATH

# Install wget and gnupg for downloading Maven
RUN apt-get update && \
    apt-get install -y wget gnupg net-tools curl procps screen && \
    rm -rf /var/lib/apt/lists/*

# Download and install Maven
RUN wget -qO- "https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz" | tar -xz -C /usr/share && \
    mv /usr/share/apache-maven-$MAVEN_VERSION $MAVEN_HOME && \
    ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn

# Verify Maven installation
RUN mvn --version

# ENVS for the test cases to run against
ARG APP_IP
ENV APP_IP=$APP_IP

ARG GRID_URL
ENV GRID_URL=$GRID_URL

# Set working directory
WORKDIR /workspace
COPY . /workspace

# Command to run when the container starts
ENTRYPOINT sh runner.sh
