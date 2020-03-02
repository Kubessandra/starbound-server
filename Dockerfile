FROM ubuntu:16.04

WORKDIR /
RUN mkdir -p /steamcmd/starbound
RUN apt-get update && apt-get -y install lib32gcc1 libvorbisfile3 wget
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -zxvf steamcmd_linux.tar.gz -C /steamcmd/
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        libcurl4-openssl-dev:i386 && \
    ls -la /usr/lib/*/libcurl.so* && \
    ln -sf /usr/lib/i386-linux-gnu/libcurl.so.4 /usr/lib/i386-linux-gnu/libcurl.so && \
    ln -sf /usr/lib/i386-linux-gnu/libcurl.so.4 /usr/lib/i386-linux-gnu/libcurl.so.3

VOLUME ["/steamcmd/starbound"]

ENV STEAM_USERNAME=""
ENV STEAM_PASSWORD=""
ENV STEAM_GUARD=""

ADD ./start.sh /start.sh

EXPOSE 21025
CMD ["/start.sh"]