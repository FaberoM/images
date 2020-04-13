# ----------------------------------
# Environment: ubuntu
# Minimum Panel Version: 0.7.X
# ----------------------------------
FROM        mono:5

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN         useradd -u 991 -d /home/container -m container \
            && apt update \
            && apt install -y iproute2 unzip curl screen tmux
            && chmod -R 777 /var/run/screen

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
