FROM debian

RUN adduser --disabled-password --gecos "" valheim && \
mkdir /home/valheim/.config && \
chown valheim /home/valheim/.config && \
dpkg --add-architecture i386 && \
apt update && apt upgrade && \
apt install -y lib32gcc-s1 wget && \
mkdir /steam && chown valheim /steam && \
mkdir /valheim && chown valheim /valheim

USER valheim

WORKDIR /steam

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
tar xzvf steamcmd_linux.tar.gz && \
./steamcmd.sh +quit

COPY docker-entrypoint.sh .

ENTRYPOINT /steam/docker-entrypoint.sh
