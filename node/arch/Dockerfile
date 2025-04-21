FROM archlinux:latest

# Update and install packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm openssh python && \
    pacman -Scc --noconfirm

# Create user
RUN useradd -m -s /bin/bash devuser && \
    echo 'devuser:devpass' | chpasswd && \
    usermod -aG wheel devuser

# SSH setup
RUN mkdir -p /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    echo 'AllowUsers devuser' >> /etc/ssh/sshd_config

RUN ssh-keygen -A

EXPOSE 22
EXPOSE 80

CMD ["/usr/sbin/sshd", "-D"]
