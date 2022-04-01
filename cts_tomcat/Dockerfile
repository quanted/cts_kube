FROM ghcr.io/quanted/cts-tomcat-base

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

RUN useradd --create-home --shell /bin/bash tomcat && \
	chown -R tomcat:tomcat /usr/local/tomcat

# Makes license folder for chemaxon, gives user read/write privilege
RUN mkdir -p /home/tomcat/.chemaxon/licenses && \
	chmod 764 /home/tomcat/.chemaxon/licenses

# Makes "tomcat" user as owner of chemaxon dir
RUN chown -R tomcat:tomcat /home/tomcat/.chemaxon

# Sets work directory to "tomcat" folder
# WORKDIR /home/tomcat
WORKDIR /usr/local/tomcat

# Sets default user as "tomcat"
USER tomcat

# EXPOSE 8080

CMD ["catalina.sh", "run"]