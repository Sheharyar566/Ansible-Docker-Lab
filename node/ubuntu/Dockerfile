FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y openssh-server sudo python3 &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash devuser && \
    echo "devuser:devpass" | chpasswd && \
    adduser devuser sudo

RUN mkdir /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    echo 'AllowUsers devuser' >> /etc/ssh/sshd_config

EXPOSE 22
EXPOSE 80

CMD ["/usr/sbin/sshd", "-D"]
