FROM debian

WORKDIR /opt/rathena
RUN apt-get update

RUN apt-get install -y git make libmariadb-dev-compat libmariadb-dev zlib1g-dev libpcre3-dev gcc g++

COPY . .

RUN ./configure

RUN make server && chmod a+x login-server && chmod a+x char-server && chmod a+x map-server

CMD ["/opt/rathena/athena-start", "start"]
