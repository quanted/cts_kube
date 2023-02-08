# FROM ghcr.io/quanted/cts-tomcat-base
FROM tomcat:8.5.77-jdk8-openjdk

RUN rm -rf /usr/local/tomcat/webapps/*

COPY webapps /usr/local/tomcat/webapps/

# Creates "tomcat" user, makes them owner of tomcat app dir
RUN useradd --create-home --shell /bin/bash tomcat && \
	mkdir -p /home/tomcat/.chemaxon/licenses && \
	chmod 764 /home/tomcat/.chemaxon/licenses && \
	chown -R tomcat:tomcat /usr/local/tomcat /home/tomcat/.chemaxon && \
	chmod -R 755 /usr/local/tomcat/webapps/webservices/

# COPY webapps /usr/local/tomcat/webapps

# RUN useradd --create-home --shell /bin/bash tomcat && \
# 	chown -R tomcat:tomcat /usr/local/tomcat

# # Makes license folder for chemaxon, gives user read/write privilege
# RUN mkdir -p /home/tomcat/.chemaxon/licenses && \
# 	chmod 764 /home/tomcat/.chemaxon/licenses

# # Makes "tomcat" user as owner of chemaxon dir
# RUN chown -R tomcat:tomcat /home/tomcat/.chemaxon

RUN apt-get remove -y python3 python3.9 && \
	apt autoremove -y && \
	rm -rf /etc/python3 && \
	rm -rf /etc/python3.9

# Sets work directory to "tomcat" folder
# WORKDIR /home/tomcat
WORKDIR /usr/local/tomcat

# Sets default user as "tomcat"
USER tomcat

# EXPOSE 8080

CMD ["catalina.sh", "run"]