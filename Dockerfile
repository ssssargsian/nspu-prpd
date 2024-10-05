FROM postgres:13

ENV POSTGRES_DB=uniplay_db
ENV POSTGRES_USER=uniplay_user
ENV POSTGRES_PASSWORD=uniplay_password

EXPOSE 5432