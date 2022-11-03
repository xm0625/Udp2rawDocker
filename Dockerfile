FROM debian
MAINTAINER xm0625

RUN apt-get update \
    && apt-get install -y iptables \
    && update-alternatives --set iptables /usr/sbin/iptables-legacy \
    && update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy \
    && apt-get clean \
    && rm -rf /tmp/* /var/cache/* /usr/share/doc/* /usr/share/man/* /var/lib/apt/lists/* \
    && mkdir -p /app

COPY . /app

WORKDIR /app
CMD ["/app/udp2raw_x86", "-c -r127.0.0.1:554 -l0.0.0.0:150 --raw-mode faketcp -a -k 'password' --cipher-mode xor --auth-mode simple --lower-level auto -a --keep-rule"]
