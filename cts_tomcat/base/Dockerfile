ARG BASE_REGISTRY=registry1.dso.mil
ARG BASE_IMAGE=ironbank/redhat/openjdk/openjdk8
ARG BASE_TAG=1.8.0

FROM tomcat:8.5.77-jdk8-openjdk AS base

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

USER root

COPY --from=base /usr/local/tomcat/ /usr/local/tomcat

RUN dnf -y update && \
    dnf -y --nodocs install ca-certificates curl gnupg dirmngr git procps bzip2 unzip fontconfig p11-kit && \ 
    set -ex && \
    set -eux && \
    rm -rf /var/lib/apt/lists/* && \
    dnf clean all

ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=/usr/local/tomcat/bin:/usr/local/openjdk-8/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir -p "$CATALINA_HOME"
# WORKDIR /usr/local/tomcat

RUN chmod -s /usr/libexec/openssh/ssh-keysign

# Resolution for CCE-80783-4
RUN chmod +t \
    /usr/local/tomcat/logs \
    /usr/local/tomcat/temp \
    /usr/local/tomcat/work
