#!/bin/bash

if [ ! -d "venv" ]; then
    echo "Creating python environment"
    python3 -m venv venv
fi

if [ ! -f "ansible" ] || [ ! -f "ansible.pub" ]; then
    echo "Creating ansible keys"
    ssh-keygen -C "ansible" -f "$PWD/ansible"
fi

source venv/bin/activate

if ! pip show ansible > /dev/null 2>&1; then
    echo "Installing ansible"
    pip install ansible
fi

docker compose up --build -d

for i in $(seq 1 3)
do
    PORT="222$i"
    echo $PORT
    sshpass -p "devpass" ssh-copy-id -i "$PWD/ansible.pub" -p $PORT devuser@localhost
done