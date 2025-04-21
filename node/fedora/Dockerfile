FROM fedora:latest

# Install required packages
RUN dnf install -y \
    openssh-server \
    sudo \
    python3 && \
    dnf clean all

# Create user with sudo privileges
RUN useradd -m -s /bin/bash devuser && \
    echo 'devuser:devpass' | chpasswd && \
    usermod -aG wheel devuser

# Configure SSH
RUN mkdir -p /var/run/sshd && \
    ssh-keygen -A && \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config && \
    echo 'AllowUsers devuser' >> /etc/ssh/sshd_config

# Expose necessary ports
EXPOSE 22
EXPOSE 80

# Start SSH daemon
CMD ["/usr/sbin/sshd", "-D"]
