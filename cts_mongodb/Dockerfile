FROM ubuntu:25.10

RUN apt-get update && apt-get install -y gnupg curl

RUN curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
	gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg \
	--dearmor

RUN echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list

RUN apt-get update && \
	apt-get install -y \
		mongodb-org=6.0.25 \
		mongodb-org-database=6.0.25 \
		mongodb-org-server=6.0.25 \
		mongodb-org-mongos=6.0.25 \
		mongodb-org-tools=6.0.25

RUN mkdir -p /data/db

EXPOSE 27017/tcp

CMD ["/usr/bin/mongod"]
