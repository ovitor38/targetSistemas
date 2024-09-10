FROM postgres:15

ENV POSTGRES_DB=target_clients
ENV POSTGRES_USER=targetuser
ENV POSTGRES_PASSWORD=targetpassword

COPY init.sql /docker-entrypoint-initdb.d/
