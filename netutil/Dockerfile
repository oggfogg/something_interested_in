FROM debian:bullseye

RUN apt-get update \
      && apt-get install -y --no-install-recommends inetutils-ping default-mysql-client tini iproute2 net-tools \
      && rm -rf /var/lib/apt/lists/*

CMD [ "tini", "-e", "143", "--", "sleep", "infinity" ]

