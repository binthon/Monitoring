FROM telegraf:1.35.2

# DODANIE REPO Z UBUNTU ŻEBY POBRAC MIBS BO DEBIAN NIE LUBI TEGO
RUN echo "deb http://deb.debian.org/debian bullseye main contrib non-free" > /etc/apt/sources.list.d/bullseye.list && \
    apt-get update && \
    apt-get install -y snmp-mibs-downloader && \
    rm -f /etc/apt/sources.list.d/bullseye.list && \
    rm -rf /var/lib/apt/lists/* \
    rm -f /usr/share/snmp/mibs/ietf/SNMPv2-PDU

ENV MIBS=all
