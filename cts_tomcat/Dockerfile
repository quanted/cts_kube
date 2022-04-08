# FROM ghcr.io/quanted/cts-tomcat-base
FROM tomcat:8.5.77-jdk8-openjdk

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