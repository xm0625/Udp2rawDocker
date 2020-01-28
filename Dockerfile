FROM debian
MAINTAINER xm0625

RUN mkdir -p /app

COPY . /app

WORKDIR /app
CMD ["udp2raw_x86", "-c -r127.0.0.1:554 -l0.0.0.0:150 --raw-mode faketcp -a -k 'password' --cipher-mode xor --auth-mode simple"]