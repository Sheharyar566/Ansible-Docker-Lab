FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    openssh-server \
    python3 \
    && apt-get clean

RUN mkdir /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
